import 'package:challenge_03/app/view/widgets/custom_appbar.dart';
import 'package:challenge_03/initial/controller/cripto_fav_provider.dart';
import 'package:challenge_03/initial/model/coin.dart';
import 'package:challenge_03/routes/route_names.dart';
import 'package:challenge_03/util/setup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/listtile_coin.dart';

class InitialView extends StatelessWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CriptoFavProvider(
        repository: service(),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF19152e),
          appBar: const CustomAppBar(),
          body: Consumer<CriptoFavProvider>(
            builder: (context, vm, child) => _buildListCrypoFav(
              coinsList: vm.favCoins,
              onDelete: vm.removeCoin,
              gettingFavCoins: vm.gettingFavCoins,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF13ebf6),
            child: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(
              context,
              addCriptoViewRoute,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListCrypoFav({
    required List<Coin> coinsList,
    required Function onDelete,
    required bool gettingFavCoins,
  }) {
    if (gettingFavCoins) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (coinsList.isEmpty) {
      return const Center(
        child: Text(
          'No hay monedas favoritas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final Coin coin = coinsList[index];
        return Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.8),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
              ),
            ],
          ),
          child: ListTileCoin(
            coin: coin,
            onDelete: onDelete,
          ),
        );
      },
      itemCount: coinsList.length,
    );
  }
}
