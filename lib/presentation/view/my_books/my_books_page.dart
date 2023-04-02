import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_care/utils/colors.dart';
import 'package:share_care/utils/sizes.dart';

import '../../view_models/home_controller.dart';
import '../add_books_page/add_books_page.dart';
import '../custom_widgets/my_books_widget.dart';

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({Key? key}) : super(key: key);

  @override
  State<MyBooksPage> createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGround,
      appBar: AppBar(
        title: Text('My Books'),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            HomeController homeController = Get.find();
            homeController.getBooks();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddBooksPage()));
          },
          child: Icon(Icons.exposure_plus_1)),
      body: GetBuilder<HomeController>(
        builder: (homeController) => ListView.builder(
          itemCount: homeController.myBooks.length,
          itemBuilder: (BuildContext context, int index) {
            return MyBooksWidget(
              title: homeController.myBooks[index].title,
              author: homeController.myBooks[index].author,
              edition: homeController.myBooks[index].edition,
              imgUrl: homeController.myBooks[index].imgUrl,
            );
          },
        ),
      ),
    );
  }
}

