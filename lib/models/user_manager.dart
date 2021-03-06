import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  FirebaseUser _user;

  Future<void> signIn({User user, Function onSuccess, Function onFail}) async {
    loading = true;

    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      _user = result.user;
      onSuccess();
    } on PlatformException catch (exception) {
      onFail(getErrorString(exception.code));
    }

    loading = false;
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    final FirebaseUser currentUser = await auth.currentUser();

    if (currentUser != null) _user = currentUser;

    notifyListeners();
  }
}
