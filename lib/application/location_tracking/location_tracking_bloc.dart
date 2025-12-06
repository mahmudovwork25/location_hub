import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:location_hub/application/location_tracking/location_tracking_event.dart';
import 'package:location_hub/application/location_tracking/location_tracking_state.dart';
import 'package:location_hub/domain/repositories/location_repository.dart';
import 'package:location_hub/domain/repositories/tracking_repository.dart';

/// BLoC for managing location tracking
@injectable
class LocationTrackingBloc
    extends Bloc<LocationTrackingEvent, LocationTrackingState> {
  final LocationRepository _locationRepository;
  final TrackingRepository _trackingRepository;

  StreamSubscription? _trackingStatusSubscription;

  LocationTrackingBloc(this._locationRepository, this._trackingRepository)
    : super(const LocationTrackingState.initial()) {
    // Register event handlers
    on<StartTracking>(_onStartTracking);
    on<StopTracking>(_onStopTracking);
    on<StatusUpdated>(_onStatusUpdated);
    on<RequestStatus>(_onRequestStatus);
    on<SyncCachedLocations>(_onSyncCachedLocations);

    // Listen to tracking status updates from the repository
    _listenToTrackingStatus();
  }

  void _listenToTrackingStatus() {
    _trackingStatusSubscription = _trackingRepository
        .getTrackingStatusStream()
        .listen((status) {
          // Convert tracking status to event
          add(
            LocationTrackingEvent.statusUpdated(
              isRunning: status.isRunning,
              isConnected: status.isConnected,
              connectionState: status.connectionState,
              locationsSent: status.locationsSent,
              locationsCached: status.locationsCached,
              currentLocation: status.currentLocation,
            ),
          );
        });
  }

  Future<void> _onStartTracking(
    StartTracking event,
    Emitter<LocationTrackingState> emit,
  ) async {
    try {
      emit(const LocationTrackingState.loading());

      print('🚀 [BLOC] Starting tracking...');
      await _trackingRepository.startTracking();

      // Initial state while waiting for first update
      emit(
        const LocationTrackingState.active(
          isConnected: false,
          connectionState: 'Starting...',
          locationsSent: 0,
          locationsCached: 0,
        ),
      );
    } catch (e) {
      print('❌ [BLOC] Error starting tracking: $e');
      emit(LocationTrackingState.error('Failed to start tracking: $e'));
    }
  }

  Future<void> _onStopTracking(
    StopTracking event,
    Emitter<LocationTrackingState> emit,
  ) async {
    try {
      print('🛑 [BLOC] Stopping tracking...');
      await _trackingRepository.stopTracking();

      // Get final counts before stopping
      final sent = state.maybeMap(
        active: (s) => s.locationsSent,
        orElse: () => 0,
      );
      final cached = state.maybeMap(
        active: (s) => s.locationsCached,
        orElse: () => 0,
      );

      emit(
        LocationTrackingState.stopped(
          locationsSent: sent,
          locationsCached: cached,
        ),
      );
    } catch (e) {
      print('❌ [BLOC] Error stopping tracking: $e');
      emit(LocationTrackingState.error('Failed to stop tracking: $e'));
    }
  }

  void _onStatusUpdated(
    StatusUpdated event,
    Emitter<LocationTrackingState> emit,
  ) {
    if (event.isRunning) {
      emit(
        LocationTrackingState.active(
          isConnected: event.isConnected,
          connectionState: event.connectionState,
          locationsSent: event.locationsSent,
          locationsCached: event.locationsCached,
          currentLocation: event.currentLocation,
        ),
      );
      print(
        '📊 [BLOC] Status: ${event.connectionState}, Sent: ${event.locationsSent}, Cached: ${event.locationsCached}',
      );
    } else {
      emit(
        LocationTrackingState.stopped(
          locationsSent: event.locationsSent,
          locationsCached: event.locationsCached,
        ),
      );
    }
  }

  Future<void> _onRequestStatus(
    RequestStatus event,
    Emitter<LocationTrackingState> emit,
  ) async {
    print('📡 [BLOC] Requesting status update');
    await _trackingRepository.requestStatusUpdate();
  }

  Future<void> _onSyncCachedLocations(
    SyncCachedLocations event,
    Emitter<LocationTrackingState> emit,
  ) async {
    // This would typically be handled by the background service
    // but we could add manual sync logic here if needed
    print('🔄 [BLOC] Manual sync requested (handled by background service)');
  }

  @override
  Future<void> close() {
    _trackingStatusSubscription?.cancel();
    return super.close();
  }
}
