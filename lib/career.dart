import 'package:flutter/material.dart';
class Career extends StatefulWidget {
  const Career({super.key});

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          // Text('Counselling',style: TextStyle(fontSize: 45,fontWeight: FontWeight.w100),),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon( Icons.home, )),

          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/career.png'),
                fit: BoxFit.fill,
              )),
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 72.0),
                  child: Text(
                    'Career',
                    style: TextStyle(
                      fontSize: 38,
                    ),
                  ),
                ),
                Container(
                  height: 220,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 240.0),
                  child: Container(
                    child: Text(
                      'Title',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  width: 290,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.lightBlue.shade50),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 65,top: 10),
                    child: Text('Career Guidence',style: TextStyle(fontSize: 20),),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 290,
                  height: 50,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.lightBlue.shade50),
                  child:Padding(
                    padding: const EdgeInsets.only(left: 28.0,top: 5),
                    child: Text('https://youtu.be/RDxMxOKpoQQ?si=nUWPQPq1CPoJb6tU'),
                  ),
                  // TextField(),
                ),
                SizedBox(
                  height: 10,
                ),

              ]),
        )
    );
  }
}
