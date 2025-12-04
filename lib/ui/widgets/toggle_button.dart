import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class ToggleButton extends StatefulWidget {
  final VoidCallback onStateChanged;

  const ToggleButton({super.key, required this.onStateChanged});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: FlutterBackgroundService().isRunning(),
      builder: (context, snapshot) {
        final isRunning = snapshot.data ?? false;
        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () async {
              print('\n🔘 [UI] Toggle button pressed');
              final service = FlutterBackgroundService();
              var running = await service.isRunning();
              print('[UI] Service running status: $running');

              if (running) {
                print('[UI] Stopping service...');
                service.invoke("stopService");
                print('✅ [UI] Stop command sent');
              } else {
                print('[UI] Starting service...');
                service.startService();
                print('✅ [UI] Service started');
              }

              // Notify parent to rebuild
              widget.onStateChanged();
              // Rebuild local state
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isRunning ? const Color(0xFFE53E3E) : const Color(0xFF667EEA),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isRunning ? Icons.stop : Icons.play_arrow, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  isRunning ? 'Stop Tracking' : 'Start Tracking',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
