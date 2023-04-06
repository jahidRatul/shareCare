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

class _MyBooksPageState extends State<MyBooksPage> with SingleTickerProviderStateMixin {

    late final TabController _tabController = TabController(length: 2, vsync: this);
   @override
  void initState() {
   // _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGround,
      appBar: AppBar(
       elevation: 5,
        backgroundColor: Colors.deepPurple,
        title: Text('Requests'),
        leading: IconButton(
          icon: Icon(Icons.request_page),
          onPressed: (){
            HomeController homeController = Get.find();
            homeController.getBooks();
          },
        ),
        bottom: PreferredSize(

          preferredSize: Size(0,50),
          child: TabBar(controller: _tabController,indicatorColor: Colors.greenAccent,labelPadding: EdgeInsets.all(10),
              indicatorWeight: 8,labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
              tabs: [

                Text("My Requests"),
                Text("Requests by Others"),

      ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddBooksPage()));
          },
          child: Icon(Icons.exposure_plus_1)),
      body: TabBarView(
        controller: _tabController,
        children: [

          GetBuilder<HomeController>(
            builder: (homeController) => ListView.builder(
              itemCount: homeController.myBooks.length,
              itemBuilder: (BuildContext context, int index) {
                return MyBooksWidget(
                  title: homeController.myBooks[index].title,
                  author: homeController.myBooks[index].author,
                  edition: homeController.myBooks[index].edition,
                  imgUrl: homeController.myBooks[index].imgUrl,
                  price: homeController.myBooks[index].price,
                  owner:  homeController.myBooks[index].owner,
                );
              },
            ),
          ),
          GetBuilder<HomeController>(
            builder: (homeController) => ListView.builder(
              itemCount: homeController.myBooks.length,
              itemBuilder: (BuildContext context, int index) {
                return MyBooksWidget(
                  title: homeController.myBooks[index].title,
                  author: homeController.myBooks[index].author,
                  edition: homeController.myBooks[index].edition,
                  imgUrl: homeController.myBooks[index].imgUrl,
                  price: homeController.myBooks[index].price,
                  owner:  homeController.myBooks[index].owner,
                );
              },
            ),
          ),
        ],

      ),
    );
  }
}

