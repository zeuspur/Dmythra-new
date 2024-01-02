import 'package:dmythra2/about_organization.dart';
import 'package:dmythra2/academic.dart';
import 'package:dmythra2/firebase_options.dart';
import 'package:dmythra2/org_acceptedrequest.dart';
import 'package:dmythra2/activitypost.dart';
import 'package:dmythra2/career.dart';
import 'package:dmythra2/clothes.dart';
import 'package:dmythra2/counselling.dart';
import 'package:dmythra2/org_userlist.dart';
import 'package:dmythra2/org_viewactivity.dart';
import 'package:dmythra2/organization_sponserlist.dart';
import 'package:dmythra2/food.dart';
import 'package:dmythra2/fund.dart';
import 'package:dmythra2/help.dart';
import 'package:dmythra2/loginpage.dart';
import 'package:dmythra2/manageacademic.dart';
import 'package:dmythra2/managecareer&academic.dart';
import 'package:dmythra2/managecareer.dart';
import 'package:dmythra2/managetherapy.dart';
import 'package:dmythra2/medication.dart';
import 'package:dmythra2/medicines.dart';
import 'package:dmythra2/organizationlogin.dart';
import 'package:dmythra2/orghome.dart';
import 'package:dmythra2/other.dart';
import 'package:dmythra2/physiotherapy.dart';
import 'package:dmythra2/sponserhome.dart';
import 'package:dmythra2/sponserlogin.dart';
import 'package:dmythra2/sponserregistration.dart';
import 'package:dmythra2/sponsor_profile.dart';
import 'package:dmythra2/sponsor_viewactivities.dart';
import 'package:dmythra2/startingpage.dart';
import 'package:dmythra2/therapysupport.dart';
import 'package:dmythra2/training.dart';
import 'package:dmythra2/transportation.dart';
import 'package:dmythra2/user_forgetpassword.dart';
import 'package:dmythra2/user_sponsorlist.dart';
import 'package:dmythra2/userhome.dart';
import 'package:dmythra2/userlogin.dart';
import 'package:dmythra2/userprofile.dart';
import 'package:dmythra2/userregistration.dart';
import 'package:dmythra2/orgviewrequest.dart';
import 'package:dmythra2/yoga.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false ,
      home: Startingpage(),
    );
  }
}

