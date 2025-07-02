import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/bloc/login_event.dart';
import 'package:flutter_intro/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {  
  LoginBloc() : 
  
  super(LoginState(token: '')) {

    on<LoginSendEvent>((event, emit){
      print("En el evento LogiSendEvent");
      print(event.toString());
    });

    on<LoginSuccesEvent>((event, emit) {
      emit(LoginState(token: state.token));
    });

    on<LoginErrorEvent>((event, emit) {
      
      emit(LoginState(token: ''));
    });

  }
}