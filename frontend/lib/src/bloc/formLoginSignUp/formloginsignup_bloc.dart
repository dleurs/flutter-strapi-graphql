import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frontend/src/api/authentication_api_provider.dart';
import 'package:frontend/src/bloc/formLoginSignUp/bloc.dart';

class FormLoginSignupBloc
    extends Bloc<FormLoginSignupEvent, FormLoginSignupState> {
  final AuthenticationApiProvider _provider;
  FormLoginSignupBloc(this._provider) : super(FormLoginSignupInitial());

  @override
  Stream<FormLoginSignupState> mapEventToState(
    FormLoginSignupEvent event,
  ) async* {
    if (event is CheckEmailEvent) {
      yield CheckEmailProcessing();
      try {
        bool isEmailExist = await _provider.isEmailExist(email: event.email);
        if (isEmailExist) {
          yield EmailAlreadyExist();
        } else {
          yield EmailDoesNotExist();
        }
      } catch (e) {
        yield CheckEmailError(error: 'Checking email failed');
      }
    }
    if (event is CheckEmailReset) {
      yield FormLoginSignupInitial();
    }
  }
}
