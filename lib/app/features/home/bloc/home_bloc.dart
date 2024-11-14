import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/di/di.dart';
import 'package:flutter_application/domain/domain.dart';

part "home_event.dart";
part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TopJobsRepository topJobsRepository;
  HomeBloc(this.topJobsRepository) : super(HomeInitial()) {
    on<HomeLoad>(_homeLoad);
  }
  Future<void> _homeLoad(event, emit) async {
    try {
      if (state is! HomeLoadSuccess) {
        emit(HomeLoadInProgress());
      }
      final articles = await topJobsRepository.getTopJobs();
      emit(HomeLoadSuccess(
        articles: articles,
      ));
    } catch (exception, state) {
      emit(HomeLoadFailure(exception: exception));
      talker.handle(exception, state);
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    talker.handle(error, stackTrace);
  }
}
