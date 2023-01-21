import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ProgemFirebaseUser {
  ProgemFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ProgemFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ProgemFirebaseUser> progemFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ProgemFirebaseUser>(
      (user) {
        currentUser = ProgemFirebaseUser(user);
        return currentUser!;
      },
    );
