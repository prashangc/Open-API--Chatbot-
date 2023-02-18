import 'dart:convert';

import 'package:chat_gpt_app/api/endpoints.dart';
import 'package:http/http.dart' as http;

class API {
  Future<String> generateResponse(String prompt) async {
    String key = apiKey;

    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $key"
      },
      body: json.encode({
        "model": "text-davinci-003",
        "prompt": prompt,
        'temperature': 0,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      }),
    );

    Map<String, dynamic> newresponse = jsonDecode(response.body);
    print('resp  = ${newresponse['choices'][0]['text']}');
    return newresponse['choices'][0]['text'];
  }
}