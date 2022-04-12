import 'package:challenge_03/initial/model/coin.dart';
import 'package:dio/dio.dart';

class CriptoRepository {
  CriptoRepository({
    required Dio dio,
  }) : _dio = dio;
  final Dio _dio;

  Future<List<Coin>> getCoinsListFromApi() async {
    try {
      final List<String> _listado = [];
      final List<Coin> _listadoCoins = [];
      Coin? _coin;
      final response = await _dio.get('https://api.cryptapi.io/info/');
      response.data.forEach((key, value) {
        if (key == 'erc20' || key == 'bep20' || key == 'trc20') {
          value.forEach((key2, value) {
            _listado.add('$key/$key2');
            _coin = Coin.fromJson(value as Map<String, dynamic>, '$key/$key2');
            if (_coin!.coin != '') {
              _listadoCoins.add(_coin!);
            }
          });
        }

        if (key != 'fee_tiers') {
          _coin = Coin.fromJson(value as Map<String, dynamic>, '$key');
          _listado.add(key.toString());
          if (_coin!.coin != '') {
            _listadoCoins.add(_coin!);
          }
        }
      });
      return _listadoCoins;
    } catch (e) {
      rethrow;
    }
  }
}
