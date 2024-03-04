import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smtm/features/all_securities/models/ticker_detail_model.dart';
import 'package:smtm/features/all_securities/repositeries/get_all_ticker_repo.dart';
import 'package:smtm/features/all_securities/ticker_bloc/ticker_bloc_state.dart';

part 'ticker_bloc_event.dart';

class TickerBlocBloc extends Bloc<TickerBlocEvent, TickerBlocState> {
  TickerBlocBloc() : super(TickerBlocInitial()) {
    on<FetchAllTickerEvent>(_handleFetchAllTickerEvent);
  }
  GetAllTickerRepository manager = GetAllTickerRepository();

  void _handleFetchAllTickerEvent(
      FetchAllTickerEvent event, Emitter<TickerBlocState> emit) async {
    emit(TickerBlocLoadingState());
    try {
      final repoResponse = await manager.getAllTickerMethod();
      log("success response");
      emit(TickerBlocSuccessState(tickerModelState: repoResponse));
    } catch (e) {
      log("error response");

      emit(TickerBlocFailedState());
    }
  }
}
