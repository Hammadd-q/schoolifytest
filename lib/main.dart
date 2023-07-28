import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/openai_api_service.dart';
import 'data/openai_repository.dart';
import 'domain/chat_bloc.dart';
import 'presentation/input_screen.dart';

void main() {
  final openAIApiService =
      OpenAIApiService("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");

  final openAIRepository = OpenAIRepository(openAIApiService);
  final chatBloc = ChatBloc(openAIRepository);

  runApp(MyApp(chatBloc));
}

class MyApp extends StatelessWidget {
  final ChatBloc chatBloc;

  MyApp(this.chatBloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>.value(
      value: chatBloc,
      child: MaterialApp(
        home: InputScreen(),
      ),
    );
  }
}
