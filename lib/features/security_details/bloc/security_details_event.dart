part of 'security_details_bloc.dart';

sealed class SecurityDetailsEvent extends Equatable {
  const SecurityDetailsEvent();

  @override
  List<Object> get props => [];
}

final class FetchSecurityDetailEvent extends SecurityDetailsEvent {
  final String tickerdata;

  FetchSecurityDetailEvent({required this.tickerdata});
}
