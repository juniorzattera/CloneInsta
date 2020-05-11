import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/controllers/CameraController.dart';
import 'package:insta/screens/direct.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreen createState() => _FeedScreen();
}

CameraController camC = new CameraController();

class _FeedScreen extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.camera_alt,
              size: 32.0,
              color: Colors.black,
            ),
            onPressed: () => camC.tirarFoto()),
        title: Text('Instagram',
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 40,
              color: Colors.black,
            )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.send,
                size: 32,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Direct()));
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0),
            height: 122.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: <Widget>[
                    Stack(overflow: Overflow.visible, children: <Widget>[
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 3),
                                blurRadius: 6.0)
                          ],
                        ),
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image(
                              height: 80.0,
                              width: 80.0,
                              image:
                                  AssetImage('assets/images/users/user1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -9,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ]),
                    SizedBox(height: 5.0),
                    Text(
                      'Meu Stories',
                      style: TextStyle(
                          color: Colors.black.withOpacity(.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                ),
                story('assets/images/users/user2.jpg', 'Hacker'),
                story('assets/images/users/user3.jpg', 'Stark'),
                story('assets/images/users/patrick.jpeg', 'Patrick'),
                story('assets/images/users/borat.jpeg', 'Borat'),
                story('assets/images/users/bob.jpeg', 'Bob'),
              ],
            ),
          ),
          feed('assets/images/users/user2.jpg', 'Hacker',
              'assets/images/posts/1.jpeg'),
          feed('assets/images/users/user3.jpg', 'Stark',
              'assets/images/posts/2.jpg'),
          feed('assets/images/users/patrick.jpeg', 'Patrick',
              'assets/images/posts/3.jpg'),
          feed('assets/images/users/borat.jpeg', 'Borat',
              'assets/images/posts/4.jpg'),
          feed('assets/images/users/bob.jpeg', 'Bob',
              'assets/images/posts/5.jpg'),
        ],
      ),
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home,
                  size: 32.0, color: Colors.black.withOpacity(.9)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search,
                  size: 32.0, color: Colors.black.withOpacity(.9)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline,
                  size: 32.0, color: Colors.black.withOpacity(.9)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border,
                  size: 32.0, color: Colors.black.withOpacity(.9)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_outline,
                  size: 32.0, color: Colors.black.withOpacity(.9)),
              onPressed: () {},
            ),
          ]),
    );
  }
}

Widget story(String image, name) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(children: <Widget>[
      Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFEF6C00), width: 3),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 3), blurRadius: 6.0)
          ],
        ),
        child: CircleAvatar(
          child: ClipOval(
            child: Image(
              height: 80.0,
              width: 80.0,
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        name,
        style: TextStyle(
            color: Colors.black.withOpacity(.8), fontWeight: FontWeight.w500),
      ),
    ]),
  );
}

Widget feed(String imagemPerfil, name, imagemPostada) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(.3)))),
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(imagemPerfil)),
        title: Text(name,
            style: TextStyle(
                color: Colors.black.withOpacity(.8),
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        trailing:
            IconButton(icon: Icon(Icons.more_vert, size: 32), onPressed: () {}),
      ),
      Image.asset(
        imagemPostada,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 400,
      ),
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.favorite_border, size: 32),
                        onPressed: () {}),
                    SizedBox(width: 12),
                    IconButton(
                        icon: Icon(Icons.comment, size: 32), onPressed: () {}),
                    SizedBox(width: 12),
                    IconButton(
                        icon: Icon(Icons.send, size: 32), onPressed: () {}),
                  ],
                ),
                IconButton(
                    icon: Icon(Icons.bookmark_border, size: 32),
                    onPressed: () {}),
              ])),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Text(
            'Curtido por Junior e outras pessoas',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(.8)),
          ))
    ]),
  );
}
