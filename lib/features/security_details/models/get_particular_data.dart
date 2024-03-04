import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smtm/features/security_details/repositeries/individaul_data.dart';

class GetParticularData {
  Future<List<IndividualData>> postData(String tickerData) async {
    var getParticularDataApi =
        'https://www.onlinekhabar.com/smtm/home/watchlist';
    try {
      final response = await http.post(
        Uri.parse(getParticularDataApi),
        body: jsonEncode(<String, List<String>>{
          "tickerList": [tickerData]
        }),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      //  charset=UTF-8'

      if (response.statusCode == 200) {
        print('Data posted successfully');
        var decodedbody = jsonDecode(response.body);
        List<dynamic> responseData = decodedbody['response'];

        List<IndividualData> individualData =
            responseData.map((json) => IndividualData.fromJson(json)).toList();
        return individualData;
      } else {
        print('Failed to post data. Status code: ${response.statusCode}');

        throw Exception("something was wrong");
      }
    } catch (e) {
      print('Error posting data: $e');
      throw Exception("something was wrong");
    }
  }
}
