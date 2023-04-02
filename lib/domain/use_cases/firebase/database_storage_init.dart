import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FireBaseStorageInit {
  late FirebaseStorage storage = FirebaseStorage.instance;
  late Reference ref = storage.ref().child("book_photos");

  Future<String> uploadPhoto(File photoFile, String bookId) async {
    final String fileName = basename(photoFile.path);
    final UploadTask uploadTask =
        ref.child(bookId).child(fileName).putFile(photoFile);
    final TaskSnapshot downloadUrl = (await uploadTask);
    final String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }
}
