import 'package:share_care/data/models/book_model.dart';
import 'package:share_care/data/models/user_model.dart';

abstract class HomeRepo{
  Future<UserModel> getUserInfo(String uid);
  Future<List <BookModel>> getMyBooks();
}
