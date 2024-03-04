import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smtm/features/security_details/repositeries/individaul_data.dart';
import 'package:smtm/features/security_details/models/get_particular_data.dart';

part 'security_details_event.dart';
part 'security_details_state.dart';

class SecurityDetailsBloc
    extends Bloc<SecurityDetailsEvent, SecurityDetailsState> {
  SecurityDetailsBloc() : super(SecurityDetailsInitial()) {
    on<FetchSecurityDetailEvent>(_fetchSecurtityDetailEvent);
  }
  GetParticularData manager = GetParticularData();

  FutureOr<void> _fetchSecurtityDetailEvent(FetchSecurityDetailEvent event,
      Emitter<SecurityDetailsState> emit) async {
    emit(SecurityDetailsLoadingState());
    String dataToSend = event.tickerdata;
    try {
      final repoResponse = await manager.postData(dataToSend);
      log("success response");
      emit(SecurityDetailsSuccessstate(individualTrackerData: repoResponse));
    } catch (e) {
      log("error response");

      emit(SecurityDetailFaliureState());
    }
  }
}
