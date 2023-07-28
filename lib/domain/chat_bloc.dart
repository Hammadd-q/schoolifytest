import 'package:ads/domain/chat_repository.dart';
import 'package:bloc/bloc.dart';
import '../data/openai_repository.dart';

class ChatBloc extends Cubit<String> {
  final ChatRepository repository;

  ChatBloc(this.repository) : super('');

  Future<void> getResponse(String question) async {
    try {
      final response = await repository.getResponse(question);
      emit(response);
    } catch (e) {
      emit("Failed to get a response. Please try again.");
    }
  }
}
