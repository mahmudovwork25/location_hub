import 'package:injectable/injectable.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:location_hub/data/models/location_model.dart';

/// Remote data source for sending locations via SignalR
@singleton
class LocationRemoteDataSource {
  final String serverUrl;
  HubConnection? _hubConnection;
  bool _isConnected = false;

  LocationRemoteDataSource({@Named('serverUrl') required this.serverUrl});

  /// Check if connected to server
  bool get isConnected => _isConnected;

  /// Ensure connection is established
  Future<void> ensureConnection() async {
    if (_isConnected && _hubConnection?.state == HubConnectionState.Connected) {
      return;
    }

    try {
      print('🔌 [REMOTE_DS] Connecting to SignalR: $serverUrl');

      _hubConnection ??= HubConnectionBuilder()
          .withUrl(serverUrl)
          .withAutomaticReconnect()
          .build();

      if (_hubConnection!.state != HubConnectionState.Connected) {
        await _hubConnection!.start();
        _isConnected = true;
        print('✅ [REMOTE_DS] SignalR connected');
      }
    } catch (e) {
      _isConnected = false;
      print('❌ [REMOTE_DS] Connection failed: $e');
      rethrow;
    }
  }

  /// Send a location to the server
  Future<void> sendLocation(LocationModel location, int userId) async {
    await ensureConnection();

    if (!_isConnected) {
      throw Exception('Not connected to server');
    }

    try {
      final payload = {
        'userId': userId,
        'locations': [location.toSignalRPayload()],
      };

      await _hubConnection!.invoke('SendLocations', args: [payload]);
      print('📤 [REMOTE_DS] Location sent to server');
    } catch (e) {
      _isConnected = false;
      print('❌ [REMOTE_DS] Send failed: $e');
      rethrow;
    }
  }

  /// Disconnect from server
  Future<void> disconnect() async {
    if (_hubConnection != null) {
      await _hubConnection!.stop();
      _isConnected = false;
      print('🔌 [REMOTE_DS] Disconnected from server');
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    await disconnect();
  }
}
