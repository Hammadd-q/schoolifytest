import 'dart:async';
import 'package:ads/data/repository.dart';
import 'package:ads/domain/model/answer_model.dart';
import 'package:bloc/bloc.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final OpenAIRepository _repository;

  QuestionBloc(this._repository) : super(QuestionInitial());

  @override
  Stream<QuestionState> mapEventToState(
    QuestionEvent event,
  ) async* {
    if (event is GetAnswerEvent) {
      yield* _mapGetAnswerToState(event.question);
    }
  }

  Stream<QuestionState> _mapGetAnswerToState(String question) async* {
    yield QuestionLoadingState();
    try {
      final answer = await _repository.getAnswer(question);
      yield QuestionLoadedState(answer: AnswerModel(answer));
    } catch (e) {
      yield QuestionErrorState(message: 'Error fetching answer');
    }
  }
}
