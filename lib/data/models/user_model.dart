class UserModel {
  String? uId;
  String? name;
  String? email;
  String? phoneNo;
  String? university;
  String? password;

  UserModel({this.uId,
    this.name,
    this.email,
    this.phoneNo,
    this.password,
    this.university});


  @override
  String toString() {
    return 'User{uId: $uId, name: $name, email: $email, phoneNo: $phoneNo, university: $university, password: $password}';
  }

  UserModel.fromSnapshot(snapshot)
      :
        uId=snapshot.key,
        name= snapshot.value["name"],
        email= snapshot.value["email"],
        phoneNo= snapshot.value["phoneNo"],
        university= snapshot.value["university"],
        password= snapshot.value["password"];
}


