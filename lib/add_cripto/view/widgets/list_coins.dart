import 'package:challenge_03/add_cripto/view/widgets/add_coin_dialog.dart';
import 'package:challenge_03/initial/model/coin.dart';
import 'package:flutter/material.dart';

class ListCoins extends StatelessWidget {
  const ListCoins({
    Key? key,
    required Coin coin,
    required Function addCoinToPreferences,
    required TextEditingController textController,
  })  : _textController = textController,
        _addCoinToPreferences = addCoinToPreferences,
        _coin = coin,
        super(key: key);

  final Coin _coin;
  final TextEditingController _textController;
  final Function _addCoinToPreferences;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(
          .8,
        ), // Your desired background color
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => showAddCoinDialog(
          context,
          _coin,
          _textController,
          _addCoinToPreferences,
        ),
        child: ListTile(
          leading: Image.network(
            _coin.logo,
            width: 40,
            height: 40,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _coin.ticker.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_coin.coin, style: const TextStyle(color: Colors.black)),
                ],
              ),
              const Spacer(),
              Text(
                'USD ${_coin.fixPrice('USD')}',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showAddCoinDialog(
  BuildContext context,
  Coin coin,
  TextEditingController textController,
  Function addCoinToPreferences,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AddCoinDialog(
        coin: coin,
        textController: textController,
        addCoinToPreferences: addCoinToPreferences,
      );
    },
  );
}
