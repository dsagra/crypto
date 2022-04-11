import 'package:challenge_03/initial/model/coin.dart';
import 'package:challenge_03/repository/cripto_repository.dart';
import 'package:challenge_03/routes/route_names.dart';
import 'package:challenge_03/util/preferences.dart';
import 'package:flutter/material.dart';

class AddCriptoProvider extends ChangeNotifier {
  AddCriptoProvider({
    required CriptoRepository repository,
  }) : criptoRepository = repository {
    getCoinsList();
  }
  final CriptoRepository criptoRepository;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  TextEditingController get textController => _textController;
  List<Coin> _listCoinsFiltered = [];
  List<Coin> get listCoinsFiltered => _listCoinsFiltered;

  /// Filtrado de lista de criptomonedas
  void filterListCoins() {
    final String filter = _searchController.text.toLowerCase();
    List<Coin> filtered = [];
    filtered = _listCoins
        .where(
          (coin) =>
              coin.coin.toLowerCase().contains(filter) ||
              coin.ticker.toLowerCase().contains(filter),
        )
        .toList();
    _listCoinsFiltered = filtered;
    notifyListeners();
  }

  TextEditingController get searchController => _searchController;

  final List<Coin> _listCoins = [];
  final _prefs = Preferences();

  List<Coin> get listCoins => _listCoins;

  /// Obtener lista de criptomonedas
  Future<void> getCoinsList() async {
    final List<String> _listCoinsName =
        await criptoRepository.getCoinsNameList();
    final List<String> _list =
        _prefs.coins.map((e) => e.split(':')[0]).toList();

    for (final coinName in _listCoinsName) {
      // Muestro solo las que no tengo en favoritos
      if (!_list.contains(coinName.split(':')[0])) {
        final Coin? coin = await criptoRepository.getCoinPrice(coinName);
        if (coin != null) {
          _listCoins.add(coin);
          _listCoinsFiltered.add(coin);
        }
      }
    }
    notifyListeners();
  }

  // addCoinToPreferences
  void addCoin(String coinName, String cantidad) {
    final List<String> coins = _prefs.coins;
    coins.add('$coinName:$cantidad');
    _prefs.coins = coins;
  }

  void addCoinToPreferences(Coin coin, BuildContext context) {
    if (_textController.text != '') {
      addCoin(coin.name, _textController.text);
      print(_textController.text);
      Navigator.of(context).pop();
      Navigator.pushNamed(context, initialViewRoute);
    }
  }

  /// Trae el precio de cada criptomoneda
  // Future<Coin> getCoinPrice(String coinName) async {
  //   final Coin coin = await criptoRepository.getCoinPrice(coinName);
  //   return coin;
  // }
}
