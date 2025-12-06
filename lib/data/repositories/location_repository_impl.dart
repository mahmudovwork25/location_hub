import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:location_hub/data/datasources/geolocator_datasource.dart';
import 'package:location_hub/data/datasources/location_local_datasource.dart';
import 'package:location_hub/data/datasources/location_remote_datasource.dart';
import 'package:location_hub/data/models/location_model.dart';
import 'package:location_hub/domain/entities/location.dart';
import 'package:location_hub/domain/repositories/location_repository.dart';

/// Implementation of LocationRepository
///
/// Coordinates between local, remote, and GPS data sources.
/// Handles offline caching and sync logic.
@Singleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final GeolocatorDataSource _gpsDataSource;
  final LocationLocalDataSource _localDataSource;
  final LocationRemoteDataSource _remoteDataSource;

  static const int _userId = 3; // TODO: Make this configurable

  LocationRepositoryImpl(this._gpsDataSource, this._localDataSource, this._remoteDataSource);

  @override
  Stream<Location> getLocationUpdates() {
    return _gpsDataSource.getLocationStream().map((model) => model.toEntity());
  }

  @override
  Future<void> sendLocation(Location location) async {
    final model = LocationModel.fromEntity(location);

    try {
      // Try to send to remote first
      await _remoteDataSource.ensureConnection();
      await _remoteDataSource.sendLocation(model, _userId);
      print('✅ [REPO] Location sent to server');
    } catch (e) {
      // If send fails, cache it
      print('⚠️ [REPO] Remote send failed, caching location: $e');
      await cacheLocation(location);
    }
  }

  @override
  Future<List<Location>> getCachedLocations() async {
    final models = await _localDataSource.getCachedLocations();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> cacheLocation(Location location) async {
    final model = LocationModel.fromEntity(location);
    await _localDataSource.cacheLocation(model);
  }

  @override
  Future<void> removeFirstCached() async {
    await _localDataSource.removeFirstCached();
  }

  @override
  Future<void> clearCache() async {
    await _localDataSource.clearCache();
  }

  @override
  Future<bool> hasCachedLocations() async {
    return _localDataSource.hasCachedLocations();
  }

  @override
  Future<int> getCachedCount() async {
    return _localDataSource.getCachedCount();
  }

  /// Sync all cached locations to server
  Future<void> syncCachedLocations() async {
    if (!_localDataSource.hasCachedLocations()) return;

    print('🔄 [REPO] Syncing ${_localDataSource.getCachedCount()} cached locations');

    final cachedLocations = await getCachedLocations();

    for (var location in cachedLocations) {
      try {
        final model = LocationModel.fromEntity(location);
        await _remoteDataSource.sendLocation(model, _userId);
        await removeFirstCached();
        print('✅ [REPO] Cached location synced and removed');
      } catch (e) {
        print('❌ [REPO] Sync failed: $e');
        break; // Stop if one fails
      }
    }
  }
}
