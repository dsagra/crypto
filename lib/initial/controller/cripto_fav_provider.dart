import 'package:challenge_03/initial/model/coin.dart';
import 'package:challenge_03/repository/cripto_repository.dart';
import 'package:challenge_03/services/coin_list_service.dart';
import 'package:challenge_03/util/preferences.dart';
import 'package:challenge_03/util/setup.dart';
import 'package:flutter/widgets.dart';

class CriptoFavProvider extends ChangeNotifier {
  CriptoFavProvider({
    required CriptoRepository repository,
  }) : criptoRepository = repository {
    getCoinsList();
  }
  final CriptoRepository criptoRepository;
  final List<Coin> _favCoins = [];
  final _prefs = Preferences();
  final List<String> _favCoinsNames = [];

  String _currency = 'USD';
  String get currency => _currency;

  void setCurrency(String? currency) {
    _currency = currency!;
    notifyListeners();
  }

  final _coinListService = service<CoinListService>();

  List<Coin> get favCoins => _favCoins;
  bool isFav(Coin coin) => _favCoins.contains(coin);
  bool _gettingFavCoins = false;
  bool get gettingFavCoins => _gettingFavCoins;

  Future<void> getCoinsList() async {
    _gettingFavCoins = true;
    notifyListeners();
    if (_coinListService.coinList.isEmpty) {
      await _coinListService.getCoinsList();
    }

    _favCoinsNames.clear();
    _favCoinsNames.addAll(_prefs.coins);
    for (final coinName in _favCoinsNames) {
      final Coin coin = _coinListService.coinList
          .firstWhere((e) => e.name == coinName.split(':')[0])
          .copyWith(
            name: coinName,
          );

      if (coin != null) {
        _favCoins.add(coin);
      }
    }
    _gettingFavCoins = false;
    notifyListeners();
  }

  void removeCoin(Coin coin) {
    _favCoins.remove(coin);
    _favCoinsNames.remove(coin.name);
    _prefs.coins = _favCoinsNames;
    notifyListeners();
  }
}
