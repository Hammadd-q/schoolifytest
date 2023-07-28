import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIApiService {
  final String _baseUrl =
      "https://api.openai.com/v1/engines/davinci/completions";

  final String _apiKey;

  OpenAIApiService(this._apiKey);

  Future<String> getResponse(String question) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: json.encode({
          'prompt': question,
          'max_tokens': 100,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final choices = data['choices'] as List<dynamic>;
        if (choices.isNotEmpty) {
          final answer = choices[0]['text'].toString();
          print("API Response: $answer");
          print("the code is ${response.statusCode}");
          return answer;
        } else {
          print("the code is ${response.statusCode}");
          throw Exception("No response from API");
        }
      } else {
        print("the code is ${response.statusCode}");
        print("API Error: Status code ${response.statusCode}");
        throw Exception(
            "Failed to get response. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("API Error: $e");
      throw Exception("Failed to communicate with the API. Error: $e");
    }
  }
}
