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
    required this.prices,
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
        prices: Prices.fromJson(json['prices'] as Map<String, dynamic>),
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
  final Prices prices;

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
        'prices': prices.toJson(),
      };
}

class Prices {
  Prices({
    required this.usd,
    required this.eur,
    required this.gbp,
    required this.cad,
    required this.jpy,
    required this.aed,
    required this.dkk,
    required this.brl,
    required this.cny,
    required this.hkd,
    required this.inr,
    required this.mxn,
    required this.ugx,
    required this.pln,
    required this.php,
    required this.czk,
    required this.huf,
    required this.bgn,
    required this.ron,
    required this.lkr,
    required this.pricesTry,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        usd: json['USD'] as String,
        eur: json['EUR'] as String,
        gbp: json['GBP'] as String,
        cad: json['CAD'] as String,
        jpy: json['JPY'] as String,
        aed: json['AED'] as String,
        dkk: json['DKK'] as String,
        brl: json['BRL'] as String,
        cny: json['CNY'] as String,
        hkd: json['HKD'] as String,
        inr: json['INR'] as String,
        mxn: json['MXN'] as String,
        ugx: json['UGX'] as String,
        pln: json['PLN'] as String,
        php: json['PHP'] as String,
        czk: json['CZK'] as String,
        huf: json['HUF'] as String,
        bgn: json['BGN'] as String,
        ron: json['RON'] as String,
        lkr: json['LKR'] as String,
        pricesTry: json['TRY'] as String,
      );

  final String usd;
  final String eur;
  final String gbp;
  final String cad;
  final String jpy;
  final String aed;
  final String dkk;
  final String brl;
  final String cny;
  final String hkd;
  final String inr;
  final String mxn;
  final String ugx;
  final String pln;
  final String php;
  final String czk;
  final String huf;
  final String bgn;
  final String ron;
  final String lkr;
  final String pricesTry;

  Map<String, dynamic> toJson() => {
        'USD': usd,
        'EUR': eur,
        'GBP': gbp,
        'CAD': cad,
        'JPY': jpy,
        'AED': aed,
        'DKK': dkk,
        'BRL': brl,
        'CNY': cny,
        'HKD': hkd,
        'INR': inr,
        'MXN': mxn,
        'UGX': ugx,
        'PLN': pln,
        'PHP': php,
        'CZK': czk,
        'HUF': huf,
        'BGN': bgn,
        'RON': ron,
        'LKR': lkr,
        'TRY': pricesTry,
      };
}
