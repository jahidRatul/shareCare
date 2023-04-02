import 'package:share_care/data/models/book_model.dart';
import 'package:share_care/data/models/user_model.dart';
import 'package:share_care/data/repositories/home_repo.dart';
import 'package:share_care/domain/use_cases/firebase/database_init.dart';

class HomepageRepoImpl implements HomeRepo{
  DatabaseInit databaseInit = DatabaseInit();

  @override
  Future<UserModel> getUserInfo(String uid) async{
    return await databaseInit.getUserInfo(uid);

  }

  @override
  Future<List <BookModel>> getMyBooks() async{

return  await databaseInit.getMyBooks();
  }


}