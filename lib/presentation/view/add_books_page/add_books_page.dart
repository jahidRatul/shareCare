import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:share_care/data/data_sources/shared_preferences/shared_preferences_manager.dart';
import 'package:share_care/data/models/book_model.dart';
import 'package:share_care/domain/use_cases/firebase/database_init.dart';
import 'package:share_care/domain/use_cases/firebase/database_storage_init.dart';
import 'package:share_care/presentation/view/custom_widgets/books_input_field.dart';
import 'package:share_care/utils/colors.dart';

import '../../view_models/home_controller.dart';

class AddBooksPage extends StatefulWidget {
  AddBooksPage({Key? key}) : super(key: key);

  @override
  State<AddBooksPage> createState() => _AddBooksPageState();
}

class _AddBooksPageState extends State<AddBooksPage> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController editionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String? forSale = "free";
  String userId = SharedPreferencesManager.getString(key: "userId").toString();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGround,
      appBar: AppBar(
        title: Text("Add Book"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 5,
              color: MyColors.form1,
              child: Container(
                child: Column(
                  children: [
                    BooksInputField(
                      hintText: "books Title",
                      textEditingController: titleController,
                      textCapitalization: TextCapitalization.sentences,

                    ),
                    BooksInputField(
                      hintText: "Author Name",
                      textEditingController: authorController,
                      textCapitalization: TextCapitalization.words,
                    ),
                    BooksInputField(
                      hintText: "Edition",
                      textEditingController: editionController,
                      textCapitalization: TextCapitalization.sentences,

                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: Text(
                              "Free",
                              style: TextStyle(color: Colors.white),
                            ),
                            activeColor: Colors.tealAccent,
                            value: "free",
                            groupValue: forSale,
                            onChanged: (value) {
                              setState(() {
                                forSale = value.toString();
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: Text(
                              "Sale",
                              style: TextStyle(color: Colors.white),
                            ),
                            activeColor: Colors.tealAccent,
                            value: "sale",
                            groupValue: forSale,
                            onChanged: (value) {
                              setState(() {
                                forSale = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: forSale == "sale",
                      child: Column(
                        children: [
                          BooksInputField(
                            hintText: "Price",
                            textEditingController: priceController,
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            myAlert();
                          },
                          child: Text('Upload Photo'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //if image not null show the image
                        //if image null show text
                        image != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    //to show image, you type like this.
                                    File(image!.path),
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                  ),
                                ),
                              )
                            : Text(
                                "No Image",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    padding: EdgeInsets.all(10),
                    backgroundColor: MyColors.submitColor),
                //if user click this button. user can upload image from camera
                onPressed: () async{
                  print("user id : $userId");

                  if (image != null) {
                    String bookID = "";
                    DatabaseInit firebaseDaTABASE = DatabaseInit();
                    bookID = firebaseDaTABASE.generateBookId();

                    FireBaseStorageInit fireStorage = FireBaseStorageInit();
                    File file = File(image!.path);
                    fireStorage.uploadPhoto(file, bookID).then((value) {
                      String? photoSubmittedUrl = value;
                      BookModel bookModel = BookModel(
                        uid: userId,
                        title: titleController.text.trim(),
                        author: authorController.text.trim(),
                        edition: editionController.text.trim(),
                        price: priceController.text.trim(),
                        bookId: bookID,
                        imgUrl: photoSubmittedUrl,
                      );
                      firebaseDaTABASE.addBooks(bookModel);
                      HomeController homeController =Get.find();
                      homeController.getBooks();
                      Navigator.pop(context);


                      print("IMG url: $photoSubmittedUrl bookId: $bookID");
                    });



                  }

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.save),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
