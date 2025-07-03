import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/bloc/login_bloc/login_event.dart';
import 'package:flutter_intro/bloc/login_bloc/login_state.dart';
import 'package:flutter_intro/models/usuario_model.dart';
import 'package:flutter_intro/utils/api_utils.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginSubmitEvent>((event, emit) async {
      //isLoading = true
      emit(LoginState(isLoading: true));
      final response = await ApiUtil.post(
        "/auth/login",
        body: {"usuario": event.usuario, "password": event.password},
      );
      //isLoading = false
      emit(LoginState(isLoading: false));
      
      final bodyDecoded = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(
          LoginState(
            usuario: UsuarioModel.fromJson({"usuario": bodyDecoded["usuario"]}),
            token: bodyDecoded["token"],
          ),
        );
      } else {
        emit(LoginState(message: bodyDecoded['message']));
      }
    });
  }
}
