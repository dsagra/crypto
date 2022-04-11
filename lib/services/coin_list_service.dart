import 'package:challenge_03/initial/model/coin.dart';
import 'package:challenge_03/repository/cripto_repository.dart';

class CoinListService {
  CoinListService({
    required CriptoRepository repository,
  }) : criptoRepository = repository;

  final CriptoRepository criptoRepository;

  final List<Coin> _coinList = [];

  List<Coin> get coinList => _coinList;

  Future<void> getCoinsList() async {
    final List<Coin> coins = [];
    final List<String> coinsNames = await criptoRepository.getCoinsList();
    for (final coinName in coinsNames) {
      final Coin? coin = await criptoRepository.getCoinPrice(coinName);
      if (coin != null) {
        coins.add(coin);
      }
    }
    _coinList.clear();
    _coinList.addAll(coins);
  }
}
