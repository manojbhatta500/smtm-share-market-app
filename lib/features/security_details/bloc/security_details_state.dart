part of 'security_details_bloc.dart';

sealed class SecurityDetailsState extends Equatable {
  const SecurityDetailsState();

  @override
  List<Object> get props => [];
}

final class SecurityDetailsInitial extends SecurityDetailsState {}

final class SecurityDetailsSuccessstate extends SecurityDetailsState {
  List<IndividualData> individualTrackerData;

  SecurityDetailsSuccessstate({required this.individualTrackerData});
  @override
  List<Object> get props => [individualTrackerData];
}

final class SecurityDetailFaliureState extends SecurityDetailsState {}

final class SecurityDetailsLoadingState extends SecurityDetailsState {}
