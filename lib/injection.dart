import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:location_hub/injection.config.dart';

/// Global service locator instance
final getIt = GetIt.instance;

/// Initialize dependency injection
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  print('🔧 [DI] Configuring dependencies...');

  // Register FlutterBackgroundService manually (external package)
  getIt.registerLazySingleton<FlutterBackgroundService>(
    () => FlutterBackgroundService(),
  );

  // Register server URL as a named dependency
  getIt.registerFactory<String>(
    () => 'http://10.100.104.128:5084/hubs/location',
    instanceName: 'serverUrl',
  );

  // Initialize injectable generated code
  getIt.init();

  print('✅ [DI] Dependency injection configured');
}
