part of 'question_bloc.dart';

abstract class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionLoadingState extends QuestionState {}

class QuestionLoadedState extends QuestionState {
  final AnswerModel answer;

  QuestionLoadedState({required this.answer});
}

class QuestionErrorState extends QuestionState {
  final String message;

  QuestionErrorState({required this.message});
}
