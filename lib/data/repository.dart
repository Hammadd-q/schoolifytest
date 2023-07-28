import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIRepository {
  final String _apiKey = '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';
  final String _apiUrl = 'https://api.openai.com/v1/answers';

  Future<String> getAnswer(String question) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {'Authorization': 'Bearer $_apiKey'},
        body: {'question': question},
      );

      final data = json.decode(response.body);
      return data['answer'] as String;
    } catch (e) {
      throw Exception('Error fetching answer');
    }
  }
}
