import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:qrscan/data/core/core.dart';
import 'package:qrscan/data/data_sources/data_sources.dart';
import 'package:qrscan/data/db/wms_database.dart';
import 'package:qrscan/data/repositories/repository_impls.dart';
import 'package:qrscan/domain/repositories/repositories.dart';
import 'package:qrscan/domain/usecases/usecases.dart';
import 'package:qrscan/presentation/cubits/autologin/autologin_cubit.dart';
import 'package:qrscan/presentation/cubits/internet/internet_cubit.dart';
import 'package:qrscan/presentation/cubits/loading/loading_cubit.dart';
import 'package:qrscan/presentation/cubits/login/login_cubit.dart';
import 'package:qrscan/presentation/cubits/manifest_tabbed/manifest_tabbed_cubit.dart';
import 'package:qrscan/presentation/cubits/manifestout/manifestout_cubit.dart';
import 'package:qrscan/presentation/cubits/manifestoutitem/manifestoutitem_cubit.dart';
import 'package:qrscan/presentation/cubits/manifestouttrack/manifestouttrack_cubit.dart';
import 'package:qrscan/presentation/cubits/scanqr/scanqr_cubit.dart';

final getItInstance = GetIt.I;

/* 
  Save in DI / Service Locator 
  - Client
  - ApiClient
  - Data Source
  - Repository
  - Usecase
  - Bloc / Cubit
*/

Future init() async {
  //General DI / Service Locator
  getItInstance.registerLazySingleton<Connectivity>(() => Connectivity());
  getItInstance.registerLazySingleton<Client>(() => Client());
  // getItInstance
  //     .registerLazySingleton<MultipartRequest>(() => MultipartRequest("POST", ));
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  //Authentication DI / Service Locator
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(getItInstance(), getItInstance()));
  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));
  getItInstance.registerFactory(() => LoginCubit(
        loginUser: getItInstance(),
        loadingCubit: getItInstance(),
        deleteUsers: getItInstance(),
      ));

  //scanQr DI / ServiceLocator
  getItInstance.registerLazySingleton<ManifestRemoteDataSource>(
      () => ManifestRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<ManifestRepository>(
      () => ManifestRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetManifestoutitem>(
      () => GetManifestoutitem(getItInstance()));
  getItInstance.registerFactory(
      () => ManifestoutitemCubit(getManifestoutitem: getItInstance()));

  getItInstance.registerLazySingleton<Scanqr>(() => Scanqr(getItInstance()));
  getItInstance.registerFactory(() => ScanqrCubit(
        manifestoutitemCubit: getItInstance(),
        manifestouttrackCubit: getItInstance(),
        scanqr: getItInstance(),
        loadingCubit: getItInstance(),
      ));

  getItInstance.registerLazySingleton<UpdateTmanifestout>(
      () => UpdateTmanifestout(getItInstance()));
  getItInstance.registerFactory(() => ManifestoutCubit(
        loadingCubit: getItInstance(),
        updateTmanifestout: getItInstance(),
      ));

  getItInstance.registerLazySingleton<InsertManifestoutTrack>(
      () => InsertManifestoutTrack(getItInstance()));
  getItInstance.registerFactory(() => ManifestouttrackCubit(
        insertManifestoutTrack: getItInstance(),
        getManifestoutTracks: getItInstance(),
      ));

  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());

  //Internet Cubit
  getItInstance.registerFactory(
    () => InternetCubit(
      connectivity: getItInstance(),
    ),
  );

  //Get Manifestout
  getItInstance.registerLazySingleton<GetManifestouts>(
      () => GetManifestouts(getItInstance()));
  getItInstance.registerFactory(() => ManifestTabbedCubit(
        getManifestouts: getItInstance(),
      ));

  //Get Manifestout Track
  getItInstance.registerLazySingleton<GetManifestoutTracks>(
      () => GetManifestoutTracks(getItInstance()));

  //SQL WMS DATABASE INJECTION
  getItInstance.registerLazySingleton<WmsDatabase>(() => WmsDatabase());
  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl(getItInstance()));
  getItInstance
      .registerLazySingleton<GetLocalUser>(() => GetLocalUser(getItInstance()));
  getItInstance
      .registerLazySingleton<DeleteUsers>(() => DeleteUsers(getItInstance()));
  getItInstance.registerFactory(() => AutologinCubit(
        getLocalUser: getItInstance(),
        deleteUsers: getItInstance(),
      ));
}
