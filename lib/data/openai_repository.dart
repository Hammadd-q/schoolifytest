import 'openai_api_service.dart';
import '../domain/chat_repository.dart';

class OpenAIRepository implements ChatRepository {
  final OpenAIApiService apiService;

  OpenAIRepository(this.apiService);

  @override
  Future<String> getResponse(String question) async {
    return await apiService.getResponse(question);
  }
}
