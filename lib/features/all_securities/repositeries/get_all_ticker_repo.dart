import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smtm/features/all_securities/models/ticker_detail_model.dart';

class GetAllTickerRepository {
  String getAllTickerApi =
      'https://www.onlinekhabar.com/smtm/search-list/tickers';

  Future<List<TickerDetailModel>> getAllTickerMethod() async {
    try {
      final response = await http.get(Uri.parse(getAllTickerApi));
      log("response.statuscode :${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        List<dynamic> responseData = decodedResponse['response'];

        List<TickerDetailModel> tickerList = responseData
            .map((json) => TickerDetailModel.fromJson(json))
            .toList();

        return tickerList;
      } else {
        log("error statuscode : ${response.statusCode}");
        log("error body : ${response.body}");
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      log("Error: $e");
      throw Exception('Failed to fetch data');
    }
  }
}
