// To parse this JSON data, do
//
//     final getAllExchangeRateModel = getAllExchangeRateModelFromJson(jsonString);

import 'dart:convert';

GetAllExchangeRateModel getAllExchangeRateModelFromJson(String str) => GetAllExchangeRateModel.fromJson(json.decode(str));

String getAllExchangeRateModelToJson(GetAllExchangeRateModel data) => json.encode(data.toJson());

class GetAllExchangeRateModel {
  List<Datum> data;

  GetAllExchangeRateModel({
    required this.data,

  });

  factory GetAllExchangeRateModel.fromJson(Map<String, dynamic> json) => GetAllExchangeRateModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  String symbol;
  String slug;
  int? cmcRank;
  int numMarketPairs;
  double circulatingSupply;
  double totalSupply;
  bool infiniteSupply;
  DateTime lastUpdated;
  DateTime dateAdded;
  List<String> tags;
  dynamic platform;
  dynamic selfReportedCirculatingSupply;
  dynamic selfReportedMarketCap;
  Map<String, Quote> quote;

  Datum({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    this.cmcRank,
    required this.numMarketPairs,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.infiniteSupply,
    required this.lastUpdated,
    required this.dateAdded,
    required this.tags,
    required this.platform,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    required this.quote,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    cmcRank: json["cmc_rank"],
    numMarketPairs: json["num_market_pairs"],
    circulatingSupply: json["circulating_supply"]?.toDouble(),
    totalSupply: json["total_supply"]?.toDouble(),
    infiniteSupply: json["infinite_supply"],
    lastUpdated: DateTime.parse(json["last_updated"]),
    dateAdded: DateTime.parse(json["date_added"]),
    tags: List<String>.from(json["tags"].map((x) => x)),
    platform: json["platform"],
    selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
    selfReportedMarketCap: json["self_reported_market_cap"],
    quote: Map.from(json["quote"]).map((k, v) => MapEntry<String, Quote>(k, Quote.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "cmc_rank": cmcRank,
    "num_market_pairs": numMarketPairs,
    "circulating_supply": circulatingSupply,
    "total_supply": totalSupply,
    "infinite_supply": infiniteSupply,
    "last_updated": lastUpdated.toIso8601String(),
    "date_added": dateAdded.toIso8601String(),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "platform": platform,
    "self_reported_circulating_supply": selfReportedCirculatingSupply,
    "self_reported_market_cap": selfReportedMarketCap,
    "quote": Map.from(quote).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Quote {
  double price;
  double volume24H;
  double volumeChange24H;
  double percentChange1H;
  double percentChange24H;
  double percentChange7D;
  double marketCap;
  double marketCapDominance;
  double fullyDilutedMarketCap;
  DateTime lastUpdated;

  Quote({
    required this.price,
    required this.volume24H,
    required this.volumeChange24H,
    required this.percentChange1H,
    required this.percentChange24H,
    required this.percentChange7D,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.lastUpdated,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    price: json["price"]?.toDouble(),
    volume24H: json["volume_24h"]?.toDouble(),
    volumeChange24H: json["volume_change_24h"]?.toDouble(),
    percentChange1H: json["percent_change_1h"]?.toDouble(),
    percentChange24H: json["percent_change_24h"]?.toDouble(),
    percentChange7D: json["percent_change_7d"]?.toDouble(),
    marketCap: json["market_cap"]?.toDouble(),
    marketCapDominance: json["market_cap_dominance"]?.toDouble(),
    fullyDilutedMarketCap: json["fully_diluted_market_cap"]?.toDouble(),
    lastUpdated: DateTime.parse(json["last_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "volume_24h": volume24H,
    "volume_change_24h": volumeChange24H,
    "percent_change_1h": percentChange1H,
    "percent_change_24h": percentChange24H,
    "percent_change_7d": percentChange7D,
    "market_cap": marketCap,
    "market_cap_dominance": marketCapDominance,
    "fully_diluted_market_cap": fullyDilutedMarketCap,
    "last_updated": lastUpdated.toIso8601String(),
  };
}
