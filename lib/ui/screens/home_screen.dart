import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:location_hub/ui/widgets/current_location_card.dart';
import 'package:location_hub/ui/widgets/location_counter_card.dart';
import 'package:location_hub/ui/widgets/status_badge.dart';
import 'package:location_hub/ui/widgets/toggle_button.dart';
import 'package:location_hub/utils/permissions_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeApp();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _initializeApp() async {
    print('🎬 [INIT] Initializing app UI...');
    await PermissionsHelper.checkAndRequestPermissions();
    await _checkServiceState();
    setState(() {
      _isInitialized = true;
    });
    print('✅ [INIT] App UI initialized');
  }

  Future<void> _checkServiceState() async {
    print('🔍 [STATE] Checking if service is already running...');
    final service = FlutterBackgroundService();
    final isRunning = await service.isRunning();
    print('[STATE] Service running: $isRunning');

    if (isRunning) {
      print('[STATE] Service is running - requesting status update...');
      service.invoke('requestStatus');
      print('✅ [STATE] Status request sent');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('🔄 [LIFECYCLE] App state changed to: $state');
    if (state == AppLifecycleState.resumed) {
      print('✅ [LIFECYCLE] App resumed - checking service state');
      _checkServiceState();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: Color(0xFF667EEA))),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(colors: [Color(0xFF667EEA), Color(0xFF764BA2)]),
                    ),
                    child: const Icon(Icons.location_on, color: Colors.white, size: 32),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location Tracker',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text('Real-time monitoring', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Status Badge
              const StatusBadge(),
              const SizedBox(height: 24),

              // Locations Sent Card
              const LocationCounterCard(),
              const SizedBox(height: 20),

              // Current Location Card
              const CurrentLocationCard(),
              const SizedBox(height: 20),

              // Toggle Button
              ToggleButton(
                onStateChanged: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
