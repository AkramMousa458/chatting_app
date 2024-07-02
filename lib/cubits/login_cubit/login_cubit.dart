import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wafed/helper/shared_preferences.dart';
part 'login_state.dart';

// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  CacheData cacheData = CacheData();
  late String userEmail;

  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      var auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      cacheData.setEmail(email: email);
      cacheData.setPassword(password: password);
      // Navigator.pushNamed(context, PeopleScreen.id, arguments: email);
      userEmail = email;
      emit(LoginSucsessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailureState(errMessage: 'User not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailureState(errMessage: 'Wrong password'));
      }
    } catch (ex) {
      emit(LoginFailureState(errMessage: 'something went wrong'));
    }
  }
}
