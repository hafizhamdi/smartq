import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SmartqClient {
  final baseUrl;
  final api;
  final body;

  SmartqClient({this.baseUrl, this.api, this.body});

  dynamic getResponse() async {
    var response = await http.get("$baseUrl/$api");
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return jsonResponse;
    } else {
      return null;
    }
  }
}
