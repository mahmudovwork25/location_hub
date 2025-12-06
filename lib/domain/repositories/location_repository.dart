import 'package:location_hub/domain/entities/location.dart';

/// Repository interface for location data operations
///
/// This abstract class defines the contract for location data access.
/// Implementation will handle caching, remote sending, and sync logic.
abstract class LocationRepository {
  /// Stream of location updates from GPS
  Stream<Location> getLocationUpdates();

  /// Send a location to the remote server
  Future<void> sendLocation(Location location);

  /// Get all cached locations stored locally
  Future<List<Location>> getCachedLocations();

  /// Cache a location for later sending (offline mode)
  Future<void> cacheLocation(Location location);

  /// Remove the first cached location (after successful send)
  Future<void> removeFirstCached();

  /// Clear all cached locations
  Future<void> clearCache();

  /// Check if there are cached locations
  Future<bool> hasCachedLocations();

  /// Get the count of cached locations
  Future<int> getCachedCount();
}
