import 'package:dmythra2/orghome.dart';
import 'package:flutter/material.dart';

class OrganizationLogin extends StatefulWidget {
  const OrganizationLogin({super.key});

  @override
  State<OrganizationLogin> createState() => _OrganizationLoginState();
}

class _OrganizationLoginState extends State<OrganizationLogin> {
  @override
  Widget build(BuildContext context) {
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
            image: AssetImage('assets/orglogin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
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
                    padding: const EdgeInsets.only(right: 160.0),
                    child: Text(
                      'Username',
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
                    child: TextField(),
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
                          child: TextField(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrganizationHome(),),);
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

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
