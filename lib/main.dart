import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'page1.dart';
import 'page2.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: <String,WidgetBuilder>{
        '/page1':(BuildContext context ) => page1(),
        '/page2':(BuildContext context ) => page2(),
        '/LoginPage':(BuildContext context ) => LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<List> login() async{
    final response = await http.post("http://192.168.2.11/login.php",body:{
      "username":user.text,
      "pass":pass.text,
    });

    var datauser = json.decode(response.body);

    if(datauser[0]['level']=='admin'){
        print(datauser);
        Navigator.pushReplacementNamed(context, '/page1');
    }
    else if(datauser[0]['level'] == 'member'){
      print(datauser);
        Navigator.pushReplacementNamed(context, '/page2');
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: user,
            decoration: InputDecoration(
              icon: Icon(Icons.mail_outline),
              hintText: 'Kullanıcı Adı',
            ),
          ),
          TextField(
            controller: pass,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.vpn_key),
              hintText: 'Şifre',
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text('Giriş'),
            onPressed: (){
                login();
            },
          ),
        ],
      ),
    );
  }
}
