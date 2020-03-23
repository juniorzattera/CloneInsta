import 'package:flutter/material.dart';

class Direct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Direct',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.video_call,
                size: 32,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.message,
                size: 24,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  labelText: 'Pesquisar',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
