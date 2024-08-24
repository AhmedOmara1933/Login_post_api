import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_post_api/models/login_model.dart';
import 'package:login_post_api/shared/network/remote/dio_helper.dart';
import '../network/end_point.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //todo///////////////////////////changePassword///////////////////////
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    emit(LoginChangePasswordState());
  }

//todo///////////////////////////loginPostData//////////////////////////////
  LoginModel ?loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel:loginModel! ));
    }).catchError((error) {
      emit(LoginErrorState(error: error.toString()));
      print(error);
    });
  }
}
