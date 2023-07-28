part of 'question_bloc.dart';

abstract class QuestionEvent {}

class GetAnswerEvent extends QuestionEvent {
  final String question;

  GetAnswerEvent(this.question);
}
