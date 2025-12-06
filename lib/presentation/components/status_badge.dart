import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_bloc.dart';
import 'package:location_hub/application/location_tracking/location_tracking_state.dart';

/// Status badge showing active/inactive state
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationTrackingBloc, LocationTrackingState>(
      builder: (context, state) {
        final isActive = state.maybeMap(active: (_) => true, orElse: () => false);

        final statusText = state.maybeMap(
          active: (s) => 'Active - ${s.connectionState}',
          stopped: (_) => 'Stopped',
          loading: (_) => 'Starting...',
          error: (s) => 'Error',
          initial: (_) => 'Inactive',
          orElse: () {},
        );

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? Colors.green.withValues(alpha: 0.2) : Colors.grey.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: isActive ? Colors.green : Colors.grey, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: isActive ? Colors.green : Colors.grey, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(
                statusText ?? "",
                style: TextStyle(color: isActive ? Colors.green : Colors.grey, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
    );
  }
}
