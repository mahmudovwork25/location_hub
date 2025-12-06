import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_event.dart';
import 'package:location_hub/application/location_tracking/location_tracking_state.dart';

/// Toggle button to start/stop location tracking
class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationTrackingBloc, LocationTrackingState>(
      builder: (context, state) {
        final isActive = state.maybeMap(active: (_) => true, orElse: () => false);

        final isLoading = state.maybeMap(loading: (_) => true, orElse: () => false);

        return GestureDetector(
          onTap: isLoading
              ? null
              : () {
                  final bloc = context.read<LocationTrackingBloc>();
                  if (isActive) {
                    bloc.add(const LocationTrackingEvent.stopTracking());
                  } else {
                    bloc.add(const LocationTrackingEvent.startTracking());
                  }
                },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: isLoading
                    ? [Colors.grey, Colors.grey.shade700]
                    : isActive
                    ? [const Color(0xFFFF416C), const Color(0xFFFF4B2B)]
                    : [const Color(0xFF11998E), const Color(0xFF38EF7D)],
              ),
              boxShadow: [
                BoxShadow(
                  color: (isActive ? const Color(0xFFFF416C) : const Color(0xFF11998E)).withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: isLoading
                  ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : Text(
                      isActive ? 'Stop Tracking' : 'Start Tracking',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
            ),
          ),
        );
      },
    );
  }
}
