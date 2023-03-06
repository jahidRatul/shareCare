import 'package:firebase_auth/firebase_auth.dart';

class DatabaseAuthCustom{
  FirebaseAuth auth = FirebaseAuth.instance;
  Future registerUser({email,password})async{
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return auth.currentUser?.uid;


    } on FirebaseAuthException catch (e) {
      print("from exeption  $e");
    }
  }
  Future signIn({email,password}) async{
    try{
      final credential =await auth.signInWithEmailAndPassword(email: email, password: password);

      return credential.user?.uid;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }

}