import 'package:flutter/material.dart';

class Organization_ViewActivities extends StatefulWidget {
  const Organization_ViewActivities({super.key});

  @override
  State<Organization_ViewActivities> createState() =>
      _Organization_ViewActivitiesState();
}

class _Organization_ViewActivitiesState
    extends State<Organization_ViewActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: Icon(
                  Icons.home,
                )),
          ],
        ),
        body: Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 75.0, left: 20.0),
              child: Text(
                'Activities',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 25.0),
              child: Container(
                height: 600,
                width: 300,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 40,
                        color: Colors.white,
                      );
                    },
                    padding: const EdgeInsets.all(8),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 290,
                            width: 375,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 5,left: 10),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/medication.png"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 110,top: 20),
                                      child: Text(
                                        'Thomas',
                                        style: TextStyle(fontSize: 20),
                                        // style: TextStyle(
                                        //      fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 250,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/Miles.png'),fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                 Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: 90,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 25),
                                        child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                                      )
                                      // ElevatedButton(
                                      //     onPressed: () {},
                                      //     child: Text(
                                      //       "Accepted",
                                      //       style:
                                      //           TextStyle(color: Colors.white),
                                      //     ),
                                      //     style: ButtonStyle(
                                      //         backgroundColor:
                                      //             MaterialStatePropertyAll(
                                      //                 Colors.green))),
                                      // Spacer(),
                                      // ElevatedButton(
                                      //   onPressed: () {},
                                      //   child: Text(
                                      //     "Accept",
                                      //     style: TextStyle(color: Colors.white),
                                      //   ),
                                      //   style: ButtonStyle(
                                      //       backgroundColor:
                                      //           MaterialStatePropertyAll(
                                      //               Colors.blue.shade900)),
                                      // ),
                                    ],
                                  ),
                                )
                                ],
                            )

                            ),

                        ],
                      );
                    }),
              ),
            )
          ]),
        ));
  }
}
