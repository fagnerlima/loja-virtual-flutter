import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/user.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn({ User user, Function onSuccess, Function onFail }) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      print(result.user.uid);
      onSuccess();
    } on PlatformException catch (exception) {
      print(getErrorString(exception.code));
      onFail(getErrorString(exception.code));
    }
  }
}
