import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:qrscan/data/core/core.dart';
import 'package:qrscan/data/data_sources/data_sources.dart';
import 'package:qrscan/data/repositories/repository_impls.dart';
import 'package:qrscan/domain/repositories/repositories.dart';
import 'package:qrscan/domain/usecases/usecases.dart';
import 'package:qrscan/presentation/cubits/loading/loading_cubit.dart';
import 'package:qrscan/presentation/cubits/login/login_cubit.dart';
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
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  //Authentication DI / Service Locator
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(getItInstance()));
  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));
  getItInstance.registerFactory(() => LoginCubit(
        loginUser: getItInstance(),
        loadingCubit: getItInstance(),
      ));

  //scanQr DI / ServiceLocator
  getItInstance.registerLazySingleton<ScanqrRemoteDataSource>(
      () => ScanqrRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<ScanqrRepository>(
      () => ScanqrRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetManifestoutitem>(
      () => GetManifestoutitem(getItInstance()));
  getItInstance.registerFactory(
      () => ManifestoutitemCubit(getManifestoutitem: getItInstance()));

  getItInstance.registerLazySingleton<Scanqr>(() => Scanqr(getItInstance()));
  getItInstance.registerFactory(() => ScanqrCubit(
        manifestoutitemCubit: getItInstance(),
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
      ));

  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
}
