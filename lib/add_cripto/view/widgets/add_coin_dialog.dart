import 'package:flutter/material.dart';

import '../../../initial/model/coin.dart';

class AddCoinDialog extends StatelessWidget {
  const AddCoinDialog({
    Key? key,
    required Coin coin,
    required TextEditingController textController,
    required Function addCoinToPreferences,
  })  : _coin = coin,
        _addCoinToPreferences = addCoinToPreferences,
        _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final Function _addCoinToPreferences;
  final Coin _coin;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    _coin.logo,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _coin.ticker.toUpperCase(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        _coin.coin,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF19152e), width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF19152e), width: 2.0),
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  hintText: 'Cantidad de ${_coin.ticker.toUpperCase()}',
                ),

                controller: _textController,
                // onChanged: (value) => _onChanged(),
                cursorColor: const Color(0xFF19152e),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancelar'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF19152e), // background
                      onPrimary: Colors.white, // foreground
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _addCoinToPreferences(
                      _coin,
                      context,
                    ),
                    child: const Text('Guardar'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF19152e), // background
                      onPrimary: Colors.white, // foreground
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
