import 'dart:convert';
import 'package:ads/data/openai_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  final mockClient = MockClient();
  final apiKey = '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';
  final apiService = OpenAIApiService(apiKey);

  test('Test successful API call', () async {
    final question = "What is the capital of France?";
    final responseJson = {
      'choices': [
        {'text': 'Paris'}
      ],
    };

    when(mockClient.post(
      Uri.parse(apiService.toString()),
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(json.encode(responseJson), 200));

    final result = await apiService.getResponse(question);
    expect(result, 'Paris');
  });

  test('Test API call with no response', () async {});

  test('Test API call with non-200 status code', () async {});
}
