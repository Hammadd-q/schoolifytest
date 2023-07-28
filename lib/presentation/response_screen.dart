import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/chat_bloc.dart';
import 'input_screen.dart';

class ResponseScreen extends StatelessWidget {
  final String question;

  ResponseScreen({required this.question});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatBloc>(context).getResponse(question);

    return Scaffold(
      appBar: AppBar(
        title: Text('Response'),
      ),
      body: BlocConsumer<ChatBloc, String>(
        listener: (context, state) {
          if (state == "Failed to get a response. Please try again.") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Failed to get a response. Please try again."),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.pop(context); // Go back to the InputScreen
          }
        },
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(state),
              ),
            );
          }
        },
      ),
    );
  }
}
