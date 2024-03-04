import 'package:equatable/equatable.dart';
import 'package:smtm/features/all_securities/models/ticker_detail_model.dart';

sealed class TickerBlocState extends Equatable {
  const TickerBlocState();

  @override
  List<Object> get props => [];
}

final class TickerBlocInitial extends TickerBlocState {}

final class TickerBlocSuccessState extends TickerBlocState {
  List<TickerDetailModel> tickerModelState;

  TickerBlocSuccessState({required this.tickerModelState});

  @override
  List<Object> get props => [tickerModelState];
}

final class TickerBlocFailedState extends TickerBlocState {}

final class TickerBlocLoadingState extends TickerBlocState {}
