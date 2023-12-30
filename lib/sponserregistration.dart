import 'package:dmythra2/authent.dart';
import 'package:dmythra2/sponserhome.dart';
import 'package:flutter/material.dart';

class SponserRegistration extends StatefulWidget {
  const SponserRegistration({super.key});

  @override
  State<SponserRegistration> createState() => _SponserRegistrationState();
}

class _SponserRegistrationState extends State<SponserRegistration> {
  BackendServices backendServices = BackendServices();
  TextEditingController sponsornameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  final signupkey = GlobalKey<FormState>();

  clearfield(){
  emailController.clear();
  passwordController.clear();
  dobController.clear();
  aadharController.clear();
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
              image: AssetImage('assets/sponsorregisteration.png'),
              fit: BoxFit.cover,
            )),
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios_new_rounded)),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: signupkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 208.0),
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
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: sponsornameController,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 158.0),
                            child: Text(
                              'Date of birth',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
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
                            padding: const EdgeInsets.only(right: 188.0),
                            child: Text(
                              'Email ID',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: emailController,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 188.0),
                            child: Text(
                              'Password',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 185.0),
                            child: Text(
                              'Aadhar no',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: aadharController,
                            ),
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {

                                if (signupkey.currentState!.validate()) {
                                  backendServices.sponsorSignUp(
                                    emailController.text,
                                    passwordController.text,
                                    sponsornameController.text,
                                    dobController.text,
                                    int.parse(aadharController.text)

                                  ) .then((value) => Navigator.of(context).pop()).then((value) => clearfield());
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
                        ]),
                  )
                ]),
              ),
            )));
  }
}
