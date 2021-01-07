import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearson_flutter/events/authentication_events.dart';
import 'package:pearson_flutter/repositories/authentication_repository.dart';
import 'package:pearson_flutter/states/authentication_states.dart';
import 'package:pearson_flutter/utils/session.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationState initialState) : super(initialState);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    // TODO: implement mapEventToState
    if (event is AppStarted) {
      var auth = Session.auth;
      if (auth != null) {
        yield AppLoggedIn();
      } else {
        yield ShowLoginPage();
      }
    }

    if(event is VerifyVoucher){
      yield VerifyingVoucher();
      try{
        var response = await AuthenticationRepository().verifyVoucher(event.voucher);
        if(response !=null){
          yield VerifiedVoucher();
        }
        else{
          yield Error();
        }
      }catch(e){
       print(e);
       yield Error();
      }
    }


  }
}
