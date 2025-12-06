import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_state.dart';

/// Card displaying current location coordinates
class CurrentLocationCard extends StatelessWidget {
  const CurrentLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<LocationTrackingBloc, LocationTrackingState>(
        builder: (context, state) {
          final location = state.mapOrNull(active: (s) => s.currentLocation);

          final lat = location?.latitude ?? 0.0;
          final lng = location?.longitude ?? 0.0;

          final isConnected = state.maybeMap(active: (s) => s.isConnected, orElse: () => false);

          final connectionState = state.maybeMap(active: (s) => s.connectionState, orElse: () => 'Disconnected');

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF667EEA), Color(0xFF764BA2)]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.3), shape: BoxShape.circle),
                  child: const Icon(Icons.location_on, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Current Location',
                  style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                _buildCoordinateRow(Icons.south, 'Latitude:', lat),
                const SizedBox(height: 12),
                _buildCoordinateRow(Icons.east, 'Longitude:', lng),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isConnected ? Colors.green.withValues(alpha: 0.3) : Colors.red.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(isConnected ? Icons.cloud_done : Icons.cloud_off, color: Colors.white, size: 12),
                      const SizedBox(width: 6),
                      Text(
                        connectionState,
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoordinateRow(IconData icon, String label, double value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(width: 12),
          Text(
            value.toStringAsFixed(6),
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
