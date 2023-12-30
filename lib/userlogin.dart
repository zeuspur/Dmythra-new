import 'package:dmythra2/authent.dart';
import 'package:dmythra2/user_forgetpassword.dart';
import 'package:dmythra2/userhome.dart';
import 'package:dmythra2/userregistration.dart';
import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  BackendServices backendServices = BackendServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final userloginkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    BackendServices backendServices = BackendServices();
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   backgroundColor: Colors.transparent,
      //   // Text('Counselling',style: TextStyle(fontSize: 45,fontWeight: FontWeight.w100),),
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Icon(Icons.arrow_back_ios)),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/user login 2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: userloginkey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 250,
                    width: 250,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 168.0),
                      child: Text(
                        'Email ID',
                        style: TextStyle(fontSize: 20),
                        // style: TextStyle(
                        //      fontSize: 20),
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
                          if (value == null || value.isEmpty) {
                            return '*required field';
                          } else {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 158.0),
                          child: Text(
                            'Password',
                            style: TextStyle(fontSize: 20),
                            // style: TextStyle(
                            //      fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.lightBlue.shade50),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => User_ForgetPassword(),
                            ),
                          );
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if(userloginkey.currentState!.validate()){  backendServices.userLogin(emailController.text,
                              passwordController.text,
                              context, 'users', UserHome());}

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => UserHome(),
                          //   ),
                          // );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: SizedBox(
                        height: 15,
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 14),
                        ),
                      ),
                    ),
                    InkWell(
                        // onTap: () {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => home(),));
                        // },
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserRegisteration(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text('Register now'),
                            ))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
