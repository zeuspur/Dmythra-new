import 'package:dmythra2/authent.dart';
import 'package:flutter/material.dart';

class ActivityPost extends StatefulWidget {
  const ActivityPost({super.key});

  @override
  State<ActivityPost> createState() => _ActivityPostState();
}

class _ActivityPostState extends State<ActivityPost> {
  BackendServices backendServices = BackendServices();
  TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Text('Activity', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 500.0, left: 35.0),
              child: Text(
                'Feed',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Positioned(
            bottom: 130.0,
            left: 20.0,
            child: InkWell(
              onTap: () async {
                await backendServices.selectPostPic(context);
                setState(() {});
              },
              child: Container(
                height: 500,
                width: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: backendServices.postPic == null
                        ? AssetImage('assets/sponge.png')
                        : FileImage(backendServices.postPic!) as ImageProvider,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50.0,
            left: 20.0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 180.0, left: 18.0),
                child: Text(
                  'Bio',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 180.0,
            left: 30.0,
            child: Container(
              width: 300.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.lightBlue.shade50,
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: TextFormField(
                controller: bioController,
                decoration: InputDecoration(
                  hintText: 'Enter your bio',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 30.0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100.0,
            left: 80.0,
            child: InkWell(
              onTap: ()async {
               await backendServices
                    .savePost(backendServices.postPic!.path, bioController.text);
               await Future.delayed(Duration(seconds: 5));
               backendServices.uploadPostPhoto(backendServices.postPic!,bioController.text);

              },
              child: Container(
                width: 200.0,
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 54.0),
                  child: Text(
                    'Add Post',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue.shade900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
