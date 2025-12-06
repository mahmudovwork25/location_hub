import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location_hub/application/location_tracking/location_tracking_bloc.dart';
import 'package:location_hub/data/datasources/location_local_datasource.dart';
import 'package:location_hub/infrastructure/services/background_service.dart';
import 'package:location_hub/injection.dart';
import 'package:location_hub/presentation/pages/home_page.dart';

void main() async {
  print('🚀 [MAIN] App starting...');
  WidgetsFlutterBinding.ensureInitialized();
  print('✅ [MAIN] Flutter binding initialized');

  // Initialize Hive
  print('💾 [MAIN] Initializing Hive...');
  await Hive.initFlutter();
  print('✅ [MAIN] Hive initialized');

  // Configure dependency injection
  print('🔧 [MAIN] Configuring dependencies...');
  await configureDependencies();
  print('✅ [MAIN] Dependencies configured');

  // Initialize local data source
  print('💾 [MAIN] Initializing local data source...');
  await getIt<LocationLocalDataSource>().initialize();
  print('✅ [MAIN] Local data source initialized');

  // Initialize the background service
  print('⚙️ [MAIN] Initializing background service...');
  await BackgroundServiceConfig.initialize();
  print('✅ [MAIN] Background service initialized');

  print('🎨 [MAIN] Starting app UI...');
  runApp(const LocationTrackerApp());
}

class LocationTrackerApp extends StatelessWidget {
  const LocationTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A1128),
      ),
      home: BlocProvider(
        create: (context) => getIt<LocationTrackingBloc>(),
        child: const HomePage(),
      ),
    );
  }
}
