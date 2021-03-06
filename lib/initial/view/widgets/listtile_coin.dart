import 'package:challenge_03/initial/model/coin.dart';
import 'package:flutter/material.dart';

class ListTileCoin extends StatelessWidget {
  const ListTileCoin({
    Key? key,
    required Coin coin,
    required Function onDelete,
    required String currency,
  })  : _onDelete = onDelete,
        _currency = currency,
        _coin = coin,
        super(key: key);

  final Coin _coin;
  final Function _onDelete;
  final String _currency;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) => _onDelete(_coin),
      confirmDismiss: (direction) async {
        final _confirm = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: const Text('¿Estás seguro?'),
            content: const Text('¿Deseas eliminar la moneda?'),
            actions: [
              ElevatedButton(
                child: const Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF19152e), // background
                  onPrimary: Colors.white, // foreground
                ),
              ),
              ElevatedButton(
                child: const Text('Eliminar'),
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF19152e), // background
                  onPrimary: Colors.white, // foreground
                ),
              ),
            ],
          ),
        );
        return _confirm as bool? ?? false;
      },
      direction: DismissDirection.startToEnd,
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red.withOpacity(.7),
        ),
        child: const Text(
          'Eliminar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      key: Key(_coin.ticker),
      child: ListTile(
        leading: (_coin.logo != '')
            ? Image.network(
                _coin.logo,
                width: 40,
                height: 40,
              )
            : Container(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _coin.totalPriceString(_currency),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Precio: $_currency ${_coin.fixPrice(_currency)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
