import 'package:firebase_database/firebase_database.dart';
import 'package:share_care/data/models/user_model.dart';

class DatabaseInit {
  late FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference databaseReference;

  Future registerUser(UserModel user) async {
    databaseReference = database.ref("user/${user.uId}");
    await databaseReference.set({
      "name": user.name,
      "email": user.email,
      "phoneNo": user.phoneNo,
      "university": user.university,
      "password": user.password,
    });
      return user.name;

  }

  Future <UserModel>getUserInfo(String uid)async{
    databaseReference = database.ref("user/");
    DataSnapshot dataSnapshot = await databaseReference.child(uid).get();
    UserModel userModel = UserModel.fromSnapshot(dataSnapshot);
    return userModel;


  }
}
