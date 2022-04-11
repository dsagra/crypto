import 'package:challenge_03/add_cripto/controller/add_cripto_provider.dart';
import 'package:challenge_03/initial/controller/cripto_fav_provider.dart';
import 'package:challenge_03/repository/cripto_repository.dart';
import 'package:challenge_03/services/coin_list_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final service = GetIt.instance;

void setup() {
  service.registerLazySingleton<Dio>(() => Dio());
  service.registerLazySingleton<CriptoFavProvider>(
    () => CriptoFavProvider(
      repository: service(),
    ),
  );
  service.registerLazySingleton<AddCriptoProvider>(
    () => AddCriptoProvider(
      repository: service(),
    ),
  );
  service.registerFactory<CriptoRepository>(
    () => CriptoRepository(
      dio: Dio(),
    ),
  );
  service.registerSingleton<CoinListService>(
    CoinListService(
      repository: service(),
    ),
  );
}
