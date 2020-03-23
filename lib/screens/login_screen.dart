import 'package:flutter/material.dart';
import 'package:insta/screens/feed_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  
  _submit(){
    if(_formKey.currentState.validate()){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FeedScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 50.0),
            ),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, 
                          vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) => !input.contains('@')
                            ? 'Por Favor, insira um email Valido'
                            : null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, 
                          vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Senha'),
                        validator: (input) => input.length < 6
                            ? 'Senha menor que 6 caracteres'
                            : null,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                        onPressed: _submit,
                        color: Colors.blue,
                        padding: EdgeInsets.all(10.0),                    
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 16.0)
                        )
                      ),
                    )
                  ],
                )
              )
          ],
        ),
      ),
    );
  }
}
