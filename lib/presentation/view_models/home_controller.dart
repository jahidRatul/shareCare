import 'package:get/get.dart';
import 'package:share_care/data/models/user_model.dart';
import 'package:share_care/data/repositories/home_repo.dart';

import '../../domain/use_cases/firebase/database_auth_custom.dart';

class HomeController extends GetxController{
  HomeRepo homeRepo;
  HomeController(this.homeRepo);

 DatabaseAuthCustom databaseAuthCustom =DatabaseAuthCustom();
 late String uid;


  @override
  void onInit() {

    uid =databaseAuthCustom.auth.currentUser?.uid??"";
    if(uid.isNotEmpty){
      getUserInfo(uid);

    }
    super.onInit();

  }




  getUserInfo(uid)async{
    UserModel userModel = await homeRepo.getUserInfo(uid);
    update();
    print(userModel.university);

  }

}