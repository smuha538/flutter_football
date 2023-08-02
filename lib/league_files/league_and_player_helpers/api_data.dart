import 'dart:convert';

import 'package:http/http.dart' as http;

Future getData(searchedItem, type) async {
  const key =
      '791efeda23749ddb252d175368d0fd280d68d171bc2f019bff9bd684f82648a6';
  var urlString = type == 'fixtures'
      ? 'https://serpapi.com/search.json?q=$searchedItem+fixtures&api_key=$key'
      : 'https://serpapi.com/search.json?q=$searchedItem&api_key=$key';
  var url = Uri.parse(urlString);
  var response = await http.get(url);
  // ignore: prefer_typing_uninitialized_variables
  var sportsData = {'no_data': 'no_data'};
  if (response.statusCode == 200 &&
      json.decode(response.body).containsKey('sports_results')) {
    var data = response.body;
    var sportsData = json.decode(data);
    return sportsData['sports_results'];
  }
  return sportsData;
}
