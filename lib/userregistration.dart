import 'package:dmythra2/authent.dart';
import 'package:dmythra2/userhome.dart';
import 'package:flutter/material.dart';

class UserRegisteration extends StatefulWidget {
  const UserRegisteration({super.key});

  @override
  State<UserRegisteration> createState() => _UserRegisterationState();
}

class _UserRegisterationState extends State<UserRegisteration> {
  BackendServices backendServices = BackendServices();
  TextEditingController udidController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController disabilityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final signupkey = GlobalKey<FormState>();

  clearfield(){udidController.clear();
  usernameController.clear();
  disabilityController.clear();
  emailController.clear();
  passwordController.clear();
  dobController.clear();
  aadharController.clear();
  phoneController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/registeration.png'),
              fit: BoxFit.cover,
            )),
            child: Form(
              key: signupkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios_new_rounded)),
                        ],
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 188.0),
                            child: SizedBox(
                              height: 30,
                              child: Text(
                                'UD ID',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: udidController,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 188.0),
                            child: SizedBox(
                              height: 30,
                              child: Text(
                                'Name',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: usernameController,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 115.0),
                            child: Text(
                              'Disability type',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: disabilityController,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 128.0),
                            child: Text(
                              'Date of birth',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: dobController,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 158.0),
                            child: Text(
                              'Email ID',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: emailController,
                              onTap: () {},
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 158.0),
                            child: Text(
                              'Password',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: passwordController,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 158.0),
                            child: Text(
                              'Aadhar no',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: aadharController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 158.0),
                            child: Text(
                              'Phone no',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: phoneController,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (signupkey.currentState!.validate()) {
                                  backendServices.signup(
                                    emailController.text,
                                    passwordController.text,
                                    udidController.text,
                                    usernameController.text,
                                    disabilityController.text,
                                    dobController.text,
                                    int.parse(aadharController.text),
                                    int.parse(phoneController.text),
                                  ).then((value) => Navigator.of(context).pop()).then((value) => clearfield());
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade900,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                        ])
                  ]),
                ),
              ),
            )));
  }
}
