import 'package:flutter/material.dart';
import 'package:share_care/data/models/user_model.dart';
import 'package:share_care/domain/use_cases/firebase/database_auth_custom.dart';
import 'package:share_care/domain/use_cases/firebase/database_init.dart';
import 'package:share_care/presentation/view/custom_widgets/custom_input_field.dart';
import 'package:share_care/utils/colors.dart';
import 'package:share_care/utils/validator/app_validetor.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final bool _isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DatabaseAuthCustom firebaseAuthCustom = DatabaseAuthCustom();
  DatabaseInit firebaseDatabaseCustom = DatabaseInit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    universityController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Card(
                    elevation: 5,
                    color: MyColors.deepBlue,
                    shadowColor: Colors.yellow,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Register Now',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        CustomInputField(
                          hintText: 'Name',
                          textEditingController: nameController,
                          validator: (value) => AppValidaTor.isEmpty(value!),
                        ),
                        CustomInputField(
                          hintText: 'Email',
                          textEditingController: emailController,
                          validator: (value) => AppValidaTor.isEmail(value!),
                        ),
                        CustomInputField(
                          hintText: 'Phone No',
                          textEditingController: phoneController,
                          validator: (value) => AppValidaTor.isMobile(value!),
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        CustomInputField(
                          hintText: 'University',
                          textEditingController: universityController,
                          validator: (value) => AppValidaTor.isEmpty(value!),
                        ),
                        CustomInputField(
                          hintText: 'Password',
                          textEditingController: passwordController,
                          validator: (value) => AppValidaTor.isPassword(value!),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 30, top: 30, right: 30),
                          child: ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      firebaseAuthCustom
                                          .registerUser(
                                              email: emailController.text.trim(),
                                              password: passwordController.text.trim())
                                          .then((value) {
                                            if(value != null){
                                              print("user uid : $value");
                                              UserModel userModel = UserModel(
                                                  uId: value,
                                                  name: nameController.text.trim(),
                                                  phoneNo: phoneController.text.trim(),
                                                  university:
                                                  universityController.text.trim(),
                                                  email: emailController.text.trim(),
                                                  password: passwordController.text.trim());
                                              firebaseDatabaseCustom.registerUser(userModel).then((value) => Navigator.pop(context));
                                            }

                                      });
                                    }
                                  },
                            child: Text(
                              _isLoading ? 'Loading...' : 'Register',
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
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Already have an Account? ',
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {}
}
