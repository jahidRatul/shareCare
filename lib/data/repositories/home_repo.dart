import 'package:share_care/data/models/user_model.dart';

abstract class HomeRepo{
  Future<UserModel> getUserInfo(String uid);
}
