import 'package:ads/data/openai_api_service.dart';
import 'package:ads/data/openai_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements OpenAIApiService {}

void main() {
  final mockApiService = MockApiService();
  final repository = OpenAIRepository(mockApiService);

  test('Test successful API call from repository', () async {
    final question = "What is the capital of France?";
    final responseFromApi = "Paris";
    when(mockApiService.getResponse(question))
        .thenAnswer((_) async => responseFromApi);

    final result = await repository.getResponse(question);
    expect(result, responseFromApi);
  });

  test('Test API call with no response from repository', () async {
    final question = "What is the capital of Mars?";
    when(mockApiService.getResponse(question))
        .thenThrow(Exception("No response from API"));
    expect(() => repository.getResponse(question), throwsException);
  });

  test('Test API call with error from repository', () async {
    final question = "What is the capital of France?";

    when(mockApiService.getResponse(question)).thenThrow(
        Exception("Failed to communicate with the API. Error: Some error"));
    expect(() => repository.getResponse(question), throwsException);
  });
}
