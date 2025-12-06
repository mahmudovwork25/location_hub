import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location_hub/data/models/location_model.dart';

/// Local data source for location caching using Hive
@singleton
class LocationLocalDataSource {
  static const String _boxName = 'locations';
  Box? _box;

  /// Initialize the local data source
  Future<void> initialize() async {
    _box = await Hive.openBox(_boxName);
    print('✅ [LOCAL_DS] Hive box opened: $_boxName');
  }

  /// Cache a location locally
  Future<void> cacheLocation(LocationModel location) async {
    if (_box == null) await initialize();

    final payload = location.toSignalRPayload();
    await _box!.add(payload);
    print('💾 [LOCAL_DS] Location cached. Total: ${_box!.length}');
  }

  /// Get all cached locations
  Future<List<LocationModel>> getCachedLocations() async {
    if (_box == null) await initialize();

    final List<LocationModel> locations = [];
    for (var item in _box!.values) {
      try {
        final map = Map<String, dynamic>.from(item as Map);
        locations.add(LocationModel.fromSignalRPayload(map));
      } catch (e) {
        print('⚠️ [LOCAL_DS] Error parsing cached location: $e');
      }
    }
    return locations;
  }

  /// Remove the first cached location
  Future<void> removeFirstCached() async {
    if (_box == null) await initialize();

    if (_box!.isNotEmpty) {
      await _box!.deleteAt(0);
      print(
        '🗑️ [LOCAL_DS] First cached location removed. Remaining: ${_box!.length}',
      );
    }
  }

  /// Clear all cached locations
  Future<void> clearCache() async {
    if (_box == null) await initialize();

    await _box!.clear();
    print('🧹 [LOCAL_DS] All cached locations cleared');
  }

  /// Check if there are cached locations
  bool hasCachedLocations() {
    return (_box?.isNotEmpty ?? false);
  }

  /// Get count of cached locations
  int getCachedCount() {
    return _box?.length ?? 0;
  }

  /// Dispose resources
  Future<void> dispose() async {
    await _box?.close();
  }
}
