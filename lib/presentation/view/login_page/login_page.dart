import 'package:flutter/material.dart';
import 'package:share_care/data/data_sources/shared_preferences/shared_preferences_manager.dart';
import 'package:share_care/domain/use_cases/firebase/database_auth_custom.dart';
import 'package:share_care/presentation/view/custom_widgets/custom_input_field.dart';
import 'package:share_care/presentation/view/dashboard/dashboad.dart';
import 'package:share_care/presentation/view/registration_page/registration_page.dart';
import 'package:share_care/utils/colors.dart';
import 'package:share_care/utils/validator/app_validetor.dart';

import '../../../data/models/user_model.dart';
import '../../../utils/sizes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController(text: "nahid@g.com");

  TextEditingController passwordController = TextEditingController(text: "123123123");

  DatabaseAuthCustom firebaseAuthCustom = DatabaseAuthCustom();



  @override
  void dispose() {
    // TODO: implement dispose

    emailController.dispose();

    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    MySizes.scrX =screenSize.height;
    MySizes.scrY= screenSize.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              ),
              // image: DecorationImage(
              //   image: AssetImage("res/images/backgroundImg.png"),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: const Text(
                      'Share book, Share Knowledge..',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      color: MyColors.deepBlue,
                      shadowColor: Colors.yellow,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          CustomInputField(
                            hintText: 'Email',
                            textEditingController: emailController,
                            validator: (value) => AppValidaTor.isEmail(value!),
                          ),
                          CustomInputField(
                            hintText: 'Password',
                            textEditingController: passwordController,
                            validator: (value) =>
                                AppValidaTor.isPassword(value!),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                left: 30, top: 30, right: 30),
                            child: ElevatedButton(
                              onPressed: _isLoading
                                  ? null
                                  : () async {
                                      if (_formKey.currentState!.validate()) {

                                          firebaseAuthCustom.signIn(
                                                email: emailController.text.trim(),
                                                password:
                                                    passwordController.text.trim()).then((value) {

                                                      if (value!=null){
                                                        print(value);


                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                                                      }
                                            });



                                      }
                                    },
                              child: Text(
                                _isLoading ? 'Loading...' : 'Login',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Don\'t have an Account? ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.deepBlue3,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
