import 'package:firebase_database/firebase_database.dart';
import 'package:share_care/data/models/book_model.dart';
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

  Future addBooks(BookModel bookModel) async {
    databaseReference = database.ref("books/${bookModel.bookId}");
    await databaseReference.set({
     "bookId": bookModel.bookId,
      "uid":bookModel.uid,
      "title": bookModel.title,
      "author":  bookModel.author,
      "edition": bookModel.edition,
      "price": bookModel.price,
      "imgUrl":  bookModel.imgUrl

    });
    return bookModel.title;

  }

  String generateBookId() {
    databaseReference = database.ref("books/").push();
    return databaseReference.key ?? "";
  }

  Future <UserModel> getUserInfo(String uid) async {
    databaseReference = database.ref("user/");
    DataSnapshot dataSnapshot = await databaseReference.child(uid).get();
    UserModel userModel = UserModel.fromSnapshot(dataSnapshot);
    return userModel;
  }

  Future<List <BookModel>> getMyBooks()async{
    List<BookModel> books =[];
    databaseReference= database.ref("books/");
    DataSnapshot dataSnapshot = await databaseReference.get();
    for (var snapshot in dataSnapshot.children) {
      BookModel bookModel =BookModel.fromSnapshot(snapshot);
      print(bookModel.title);
      books.add(bookModel);
    }
    return books;

  }
}
