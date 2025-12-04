import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location_hub/services/background_service.dart';
import 'package:location_hub/ui/screens/home_screen.dart';

void main() async {
  print('🚀 [MAIN] App starting...');
  WidgetsFlutterBinding.ensureInitialized();
  print('✅ [MAIN] Flutter binding initialized');

  // Initialize Hive
  print('💾 [MAIN] Initializing Hive...');
  await Hive.initFlutter();
  await Hive.openBox('locations');
  print('✅ [MAIN] Hive initialized');

  // Initialize the background service
  print('⚙️ [MAIN] Initializing background service...');
  await BackgroundServiceConfig.initialize();
  print('✅ [MAIN] Background service initialized');

  print('🎨 [MAIN] Starting app UI...');
  runApp(const DeliveryTrackerApp());
}

class DeliveryTrackerApp extends StatelessWidget {
  const DeliveryTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A1128),
      ),
      home: const HomeScreen(),
    );
  }
}
