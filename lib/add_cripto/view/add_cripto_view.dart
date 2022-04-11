import 'package:challenge_03/add_cripto/controller/add_cripto_provider.dart';
import 'package:challenge_03/add_cripto/view/widgets/search_box.dart';
import 'package:challenge_03/initial/model/coin.dart';
import 'package:challenge_03/util/setup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/list_coins.dart';

class AddCriptoView extends StatelessWidget {
  const AddCriptoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddCriptoProvider(
        repository: service(),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Buscar Criptomoneda'),
            backgroundColor: Colors.blueGrey,
          ),
          backgroundColor: const Color(0xFF19152e),
          body: Consumer<AddCriptoProvider>(
            builder: (context, vm, child) => vm.gettingCoins
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : vm.listCoinsFiltered.isEmpty
                    ? const Center(
                        child: Text('No hay criptomonedas para agregar'),
                      )
                    : Column(
                        children: [
                          SearchBox(
                            controller: vm.searchController,
                            onChanged: vm.filterListCoins,
                          ),
                          Expanded(
                            child: Container(
                              child: _buildListCoins(
                                listCoins: vm.listCoinsFiltered,
                                controller: vm.textController,
                                addCoinToPreferences: vm.addCoinToPreferences,
                              ),
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }

  ListView _buildListCoins({
    required List<Coin> listCoins,
    required TextEditingController controller,
    required Function addCoinToPreferences,
  }) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) => ListCoins(
        textController: controller,
        coin: listCoins[index],
        addCoinToPreferences: addCoinToPreferences,
      ),
      itemCount: listCoins.length,
    );
  }
}
