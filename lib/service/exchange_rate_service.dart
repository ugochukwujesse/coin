import 'dart:convert';
import 'dart:io';

import 'package:crypto_app/model/get_all_exchange_rate_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class ExchangeRateService{
  static Future<GetAllExchangeRateModel> fetchCrypto() async {
    final headers = {
      'X-CMC_PRO_API_KEY': '657a47c5-9d18-4f0b-a177-7d6f9d62394a',
    };
    final response= await http.
    get(Uri.parse("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"),headers:headers );
    print(response.body);
    // debugPrint(response.statusCode.toString());

    if (response.statusCode==200){
      final decodeData=jsonDecode(response.body);
      final x=GetAllExchangeRateModel.fromJson(Map.from(decodeData));
      // final x=getAllExchangeRateModelFromJson(response.body);
      // print(x);
      return x;

    }
    else{

      throw Exception("Failed to load");

    }

}
}

