import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/chat_bloc.dart';
import 'response_screen.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask a Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your question'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final question = _controller.text;
                if (question.isNotEmpty) {
                  _controller.clear();
                  _navigateToResponseScreen(context, question);
                }
              },
              child: Text('Get Answer'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToResponseScreen(BuildContext context, String question) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResponseScreen(question: question),
      ),
    );
  }
}
