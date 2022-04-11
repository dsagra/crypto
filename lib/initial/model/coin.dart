class Coin {
  Coin({
    required this.name,
    required this.coin,
    required this.logo,
    required this.ticker,
    required this.minimumTransaction,
    required this.minimumTransactionCoin,
    required this.minimumFee,
    required this.minimumFeeCoin,
    required this.feePercent,
    required this.status,
    required this.mapPrices,
  });

  factory Coin.fromJson(Map<String, dynamic> json, String name) => Coin(
        coin: json['coin'] as String? ?? '',
        name: name,
        logo: json['logo'] as String? ?? '',
        ticker: json['ticker'] as String? ?? '',
        minimumTransaction: json['minimum_transaction'] as int? ?? 0,
        minimumTransactionCoin:
            json['minimum_transaction_coin'] as String? ?? '',
        minimumFee: json['minimum_fee'] as int? ?? 0,
        minimumFeeCoin: json['minimum_fee_coin'] as String? ?? '',
        feePercent: json['fee_percent'] as String? ?? '',
        status: json['status'] as String? ?? '',
        // prices: Prices.fromJson(json['prices'] as Map<String, dynamic>),
        mapPrices: (json['prices'] ?? {}) as Map<String, dynamic>,
      );

  final String coin;
  final String name;
  final String logo;
  final String ticker;
  final int minimumTransaction;
  final String minimumTransactionCoin;
  final int minimumFee;
  final String minimumFeeCoin;
  final String feePercent;
  final String status;
  final Map<String, dynamic> mapPrices;

  String fixPrice(String key) =>
      double.parse(mapPrices[key.toUpperCase()] as String? ?? '0')
          .toStringAsFixed(2);

  String totalPrice(String key) =>
      (double.parse(mapPrices[key.toUpperCase()] as String) *
              double.parse(name.split(':')[1]))
          .roundToDouble()
          .toStringAsFixed(2);

  Map<String, dynamic> toJson() => {
        'coin': coin,
        'logo': logo,
        'ticker': ticker,
        'minimum_transaction': minimumTransaction,
        'minimum_transaction_coin': minimumTransactionCoin,
        'minimum_fee': minimumFee,
        'minimum_fee_coin': minimumFeeCoin,
        'fee_percent': feePercent,
        'status': status,
      };
}
