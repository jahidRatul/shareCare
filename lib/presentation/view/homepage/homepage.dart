import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_care/data/repositories/home_repo.dart';
import 'package:share_care/data/repositories_impl/home_repo_impl.dart';
import 'package:share_care/presentation/view_models/home_controller.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomeController homeController =Get.find();
  @override
  void initState() {
    // TODO: implement initState



    print("homepage");

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:
        // Image.network(
        //   "http://202.51.187.51:8080/cbms_api/v1/auth/profile/photo/piSsKO+80yyNLFaiXk+omxjBVc9ZP1RfQpLaTkfQTRDgluKLfe1A==/6lMZA36zoUIWEvlVPLUuQYIL7XnYQeMpIKFmzxKfKfUb9XeXg==",
        //   // "http://123.200.20.21:8080/cbms_api/v1/auth/profile/photo/pPltK8c1qzO+80yyfQTRDgluKLfe1A==/q4mt+lKCFjOdfZ1dOeIk6p2xE1og==",
        //   width: 280.0,
        //   height: 400,fit: BoxFit.cover,
        // ),
        Container(
          height: 200,  width: 200,
          child: CachedNetworkImage(
            imageUrl:"https://picsum.photos/200"
          ),
        ),



      ),
    );
  }
}
