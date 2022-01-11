class Crypto {
  String id;
  String rank;
  String symbol;
  String marketCapUsd;
  String name;
  String changePercent24hr;
  String priceUsd;

  Crypto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.changePercent24hr,
    required this.priceUsd,
    required this.marketCapUsd,
    required this.rank,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      symbol: json['symbol'] ?? "",
      changePercent24hr: json['changePercent24hr'] ?? "",
      priceUsd: json['priceUsd'] ?? "",
      marketCapUsd: json['marketCapUsd'] ?? "",
      rank: json['rank'] ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}


