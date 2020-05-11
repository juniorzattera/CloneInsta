import 'package:flutter/material.dart';
import 'package:insta/controllers/CameraController.dart';
import 'package:insta/models/directUsers.dart';
import 'package:insta/screens/feed_screen.dart';
import 'package:flutter/cupertino.dart';


CameraController camC = new CameraController();

class Direct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
              size: 32.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeedScreen()));
            }),
        title: Text('Direct',
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 40,
              color: Colors.black,
            )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              CupertinoIcons.add_circled_solid,
              size: 32,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(pictures[index]),
                    ),
                    title: Text(names[index]),
                    subtitle: Text(text[index]),
                    trailing: IconButton(
                        icon: Icon(
                          CupertinoIcons.photo_camera_solid,
                          size: 32.0,
                          color: Colors.black,
                        ),
                        onPressed: () => camC.tirarFoto()),
                  ),
                  Divider(),
                ],
              );
            }),
      ),
    );
  }
}
