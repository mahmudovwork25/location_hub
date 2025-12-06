// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_background_service/flutter_background_service.dart'
    as _i403;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'application/location_tracking/location_tracking_bloc.dart' as _i514;
import 'data/datasources/geolocator_datasource.dart' as _i668;
import 'data/datasources/location_local_datasource.dart' as _i1045;
import 'data/datasources/location_remote_datasource.dart' as _i723;
import 'data/repositories/location_repository_impl.dart' as _i87;
import 'data/repositories/tracking_repository_impl.dart' as _i295;
import 'domain/repositories/location_repository.dart' as _i740;
import 'domain/repositories/tracking_repository.dart' as _i638;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i668.GeolocatorDataSource>(
      () => _i668.GeolocatorDataSource(),
    );
    gh.singleton<_i1045.LocationLocalDataSource>(
      () => _i1045.LocationLocalDataSource(),
    );
    gh.singleton<_i723.LocationRemoteDataSource>(
      () => _i723.LocationRemoteDataSource(
        serverUrl: gh<String>(instanceName: 'serverUrl'),
      ),
    );
    gh.singleton<_i638.TrackingRepository>(
      () => _i295.TrackingRepositoryImpl(gh<_i403.FlutterBackgroundService>()),
    );
    gh.singleton<_i740.LocationRepository>(
      () => _i87.LocationRepositoryImpl(
        gh<_i668.GeolocatorDataSource>(),
        gh<_i1045.LocationLocalDataSource>(),
        gh<_i723.LocationRemoteDataSource>(),
      ),
    );
    gh.factory<_i514.LocationTrackingBloc>(
      () => _i514.LocationTrackingBloc(
        gh<_i740.LocationRepository>(),
        gh<_i638.TrackingRepository>(),
      ),
    );
    return this;
  }
}
