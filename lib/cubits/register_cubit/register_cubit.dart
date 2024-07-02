// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafed/constants.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  Future<void> registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    String statues = 'At work',
    String imageUrl = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
  }) async {
    emit(RegisterLoadingState());
    CollectionReference users =
        FirebaseFirestore.instance.collection(kUsersCollection);

    try {
      if (password == confirmPassword) {
        var auth = FirebaseAuth.instance;
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        users.add({
          'email': email,
          'name': name,
          'photo': imageUrl,
          'statues': statues
        });

        emit(RegisterSuccsessState());
      } else {
        emit(RegisterNotSamePasswordState());
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailureState(errMessage: 'The password is too weak'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailureState(
            errMessage: 'The account already used'));
      }
    } catch (ex) {
      emit(RegisterFailureState(errMessage: 'Error, Please try again'));
    }
  }
}