import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

/// Service for managing SignalR connection to the server
class SignalRService {
  late HubConnection _hubConnection;
  final String serverUrl;

  SignalRService({required this.serverUrl}) {
    print('🔌 [SIGNALR] Setting up SignalR connection...');
    print('[SIGNALR] Server URL: $serverUrl');

    _hubConnection = HubConnectionBuilder().withUrl(serverUrl).withAutomaticReconnect().build();

    print('✅ [SIGNALR] HubConnection built with auto-reconnect');
  }

  /// Get current connection state
  HubConnectionState? get state => _hubConnection.state;

  /// Check if connected
  bool get isConnected => _hubConnection.state == HubConnectionState.Connected;

  /// Get connection ID
  String? get connectionId => _hubConnection.connectionId;

  /// Ensure connection is established
  Future<void> ensureConnection() async {
    print('[SIGNALR] Checking connection state: ${_hubConnection.state}');

    if (_hubConnection.state != HubConnectionState.Connected) {
      try {
        print('⏳ [SIGNALR] Attempting to connect...');
        await _hubConnection.start();
        print('✅ [SIGNALR] Connected! Connection ID: ${_hubConnection.connectionId}');
      } catch (e) {
        print('❌ [SIGNALR] Connection Error: $e');
      }
    } else {
      print('✅ [SIGNALR] Already connected (ID: ${_hubConnection.connectionId})');
    }
  }

  /// Send location data to server
  Future<void> sendLocation(Map<String, dynamic> payload) async {
    if (_hubConnection.state == HubConnectionState.Connected) {
      print('📤 [SIGNALR] Sending payload to server...');
      print('[SIGNALR] Payload: $payload');

      await _hubConnection.invoke("SendLocations", args: [payload]);
      print('✅ [SIGNALR] Data sent successfully!');
    } else {
      throw Exception('Not connected to server');
    }
  }
}
