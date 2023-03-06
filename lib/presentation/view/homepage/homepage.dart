import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_care/data/repositories/home_repo.dart';
import 'package:share_care/data/repositories_impl/home_repo_impl.dart';
import 'package:share_care/presentation/view_models/home_controller.dart';
import 'package:share_care/utils/colors.dart';

class Homepage extends StatefulWidget {
   Homepage({Key? key}) : super(key: key);



  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut<HomeRepo>(() => HomepageRepoImpl(), fenix: true);
    Get.lazyPut(() => HomeController( Get.find()), fenix: true);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.backGround,
      body: SingleChildScrollView(

        child: GetBuilder<HomeController>(
          builder:(controller)=> Container(
            child: Column(
              children: [
                Text("")
              ],
            ),

          ),
        ),
      ),
    );
  }
}
