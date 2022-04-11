import 'package:challenge_03/initial/model/coin.dart';
import 'package:dio/dio.dart';

class CriptoRepository {
  CriptoRepository({
    required Dio dio,
  }) : _dio = dio;
  final Dio _dio;

  Future<List<String>> getCoinsNameList() async {
    return [
      'btc',
      'eth',
      'bch',
      'ltc',
      'xmr',
      'erc20/bnb',
      'erc20/busd',
      'erc20/link',
      'erc20/mkr',
      'erc20/cro',
      'bep20/ada',
      'bep20/cake',
      'bep20/dai',
      'bep20/doge',
    ];
  }

  Future<List<String>> getCoinsNameListFromApi() async {
    try {
      final List<String> _listado = [];
      final List<Coin?> _listadoCoins = [];
      Coin? _coin;
      final response = await _dio.get('https://api.cryptapi.io/info/');
      print(response.data);
      response.data.forEach((key, value) {
        if (key == 'erc20' || key == 'bep20' || key == 'trc20') {
          value.forEach((key2, value) {
            _listado.add('$key/$key2');
            _coin = Coin.fromJson(value as Map<String, dynamic>, '$key/$key2');
          });
        } else {
          _coin = Coin.fromJson(value as Map<String, dynamic>, '$key');
        }
        if (key != 'fee_tiers') {
          _listado.add(key.toString());
          _listadoCoins.add(_coin);
        }
      });
      return _listado;
    } catch (e) {
      rethrow;
    }
  }

  Future<Coin?> getCoinPrice(String coin) async {
    try {
      final response =
          await _dio.get('https://api.cryptapi.io/${coin.split(':')[0]}/info/');
      return Coin.fromJson(response.data as Map<String, dynamic>, coin);
    } catch (e) {
      return null;
    }
  }
}
