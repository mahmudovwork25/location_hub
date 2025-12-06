import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_event.dart';
import 'package:location_hub/presentation/components/current_location_card.dart';
import 'package:location_hub/presentation/components/location_counter_card.dart';
import 'package:location_hub/presentation/components/status_badge.dart';
import 'package:location_hub/presentation/components/toggle_button.dart';
import 'package:location_hub/common/utils/permissions_helper.dart';

/// Home page for location tracking app
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
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

    // Check and request permissions
    await PermissionsHelper.checkAndRequestPermissions();

    // Request status update from service if already running
    if (mounted) {
      context.read<LocationTrackingBloc>().add(
        const LocationTrackingEvent.requestStatus(),
      );
    }

    print('✅ [INIT] App initialization completed');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    print('🔄 [LIFECYCLE] App state changed to: $lifecycleState');

    if (lifecycleState == AppLifecycleState.resumed) {
      print('✅ [LIFECYCLE] App resumed - requesting status update');
      context.read<LocationTrackingBloc>().add(
        const LocationTrackingEvent.requestStatus(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      gradient: const LinearGradient(
                        colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                      ),
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location Tracker',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Real-time monitoring',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Status Badge
              const StatusBadge(),
              const SizedBox(height: 16),

              // Locations Sent Card
              const LocationCounterCard(),
              const SizedBox(height: 10),

              // Current Location Card
              const CurrentLocationCard(),
              const SizedBox(height: 10),

              // Toggle Button
              const ToggleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
