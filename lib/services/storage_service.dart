import 'package:hive_flutter/hive_flutter.dart';

/// Service for managing offline location storage with Hive
class StorageService {
  static const String _boxName = 'locations';
  late Box _locationBox;

  /// Initialize Hive and open the locations box
  Future<void> initialize() async {
    print('💾 [STORAGE] Initializing Hive...');
    await Hive.initFlutter();
    _locationBox = await Hive.openBox(_boxName);
    print('✅ [STORAGE] Hive initialized with ${_locationBox.length} cached locations');
  }

  /// Get the number of cached locations
  int get cachedCount => _locationBox.length;

  /// Check if there are cached locations
  bool get hasCachedLocations => _locationBox.isNotEmpty;

  /// Get all cached locations
  List<dynamic> get allCachedLocations => _locationBox.values.toList();

  /// Cache a location when offline
  Future<void> cacheLocation(Map<String, dynamic> locationData) async {
    await _locationBox.add(locationData);
    print('💾 [STORAGE] Location cached. Total: ${_locationBox.length}');
  }

  /// Remove the first cached location (after successful send)
  Future<void> removeFirstCached() async {
    if (_locationBox.isNotEmpty) {
      await _locationBox.deleteAt(0);
    }
  }

  /// Clear all cached locations
  Future<void> clearAll() async {
    await _locationBox.clear();
    print('✅ [STORAGE] All cached locations cleared');
  }
}
