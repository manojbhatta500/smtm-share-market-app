part of 'ticker_bloc_bloc.dart';

sealed class TickerBlocEvent extends Equatable {
  const TickerBlocEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllTickerEvent extends TickerBlocEvent {}
