import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_state.dart';

/// Card displaying location sent and cached counters
class LocationCounterCard extends StatelessWidget {
  const LocationCounterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationTrackingBloc, LocationTrackingState>(
      builder: (context, state) {
        final locationsSent = state.maybeMap(
          active: (s) => s.locationsSent,
          stopped: (s) => s.locationsSent,
          orElse: () => 0,
        );

        final locationsCached = state.maybeMap(
          active: (s) => s.locationsCached,
          stopped: (s) => s.locationsCached,
          orElse: () => 0,
        );

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A2744),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF2D3F5F), width: 1),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF667EEA).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.my_location,
                  color: Color(0xFF667EEA),
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$locationsSent',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF667EEA),
                    ),
                  ),
                  Text(
                    'Locations Sent${locationsCached > 0 ? " ($locationsCached cached)" : ""}',
                    style: TextStyle(
                      fontSize: 14,
                      color: locationsCached > 0 ? Colors.orange : Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
