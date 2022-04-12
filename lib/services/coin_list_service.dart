import 'package:challenge_03/initial/model/coin.dart';
import 'package:challenge_03/repository/cripto_repository.dart';

class CoinListService {
  CoinListService({
    required CriptoRepository repository,
  }) : criptoRepository = repository;

  final CriptoRepository criptoRepository;

  final List<Coin> _coinList = [];

  List<Coin> get coinList => _coinList;

  bool get _isCoinListEmpty => _coinList.isEmpty;

  Future<void> getCoinsList() async {
    if (_isCoinListEmpty) {
      final List<Coin> coins = await criptoRepository.getCoinsListFromApi();
      _coinList.clear();
      _coinList.addAll(coins);
    }
  }
}
