import 'package:flutter/material.dart';
class Organization_UserList extends StatefulWidget {
  const Organization_UserList({super.key});

  @override
  State<Organization_UserList> createState() => _Organization_UserListState();
}

class _Organization_UserListState extends State<Organization_UserList> {
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
              icon: Icon(
                Icons.home,
              )),
        ],
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/userlist.png"),
                  fit: BoxFit.fill)),
          child: Center(
            child:
            // Container(
            // child: ListView.builder(
            // itemBuilder: itemBuilder)
            Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 75.0, left: 20.0),
                  child: Text(
                    'User ',
                    style: TextStyle(
                      fontSize: 38,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0, left: 3.0),
                  child: Container(
                    height: 220,
                    width: 320,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 40,
                            height: 220,
                            color: Colors.transparent,
                          );
                        },
                        padding: const EdgeInsets.all(8),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 18.0),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "assets/Ellipse 10.png"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8,top: 14),
                                            child: Text("Able",style: TextStyle(fontSize: 24),),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left:20 , top: 10),
                                      child: Text(
                                        'Ph:86254538910 ',
                                        style: TextStyle(fontSize: 20),
                                        // style: TextStyle(
                                        //      fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left:20 , top: 10),
                                      child: Text(
                                        'ID:DRYTU465467 ',
                                        style: TextStyle(fontSize: 20),
                                        // style: TextStyle(
                                        //      fontSize: 20),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 80,
                                      ),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.green)),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.call,
                                                  color: Colors.black,
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.red)),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  color: Colors.black,
                                                )
                                              ],
                                            ),

                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                )
              ]),
            ),
          )),
    );
  }
}
