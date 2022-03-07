
import 'dart:convert';

import 'package:app/app_properties.dart';
import 'package:app/sreens/intro_page.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:app/profil/acceuil.dart';


import 'register_page.dart';
import 'package:http/http.dart' as http;

  Future<List<User>> _getUusers() async{
    var data = await http.get(Uri.parse("http://localhost:3000/prof"));
    var jsonData = json.decode(data.body);
    List<User> users =[];
    String email ="";

   
    for(var u in jsonData){
      User user = User(u["email"], u["pass"]);
     
      users.add(user);
    }

    print(users.length);

    return users;


  }
  List<User> users =[];
  

class   WelcomeBackPage extends StatefulWidget {


  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  



   final TextEditingController _emailController =TextEditingController();
    final TextEditingController _passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {



//final databaseRef = FirebaseDatabase.instance.reference(); //database reference object




    Widget welcomeBack = Text(
      'Welcome Professeur',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Login to your account ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget loginButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: (){
  // databaseRef.push().set({'name': _emailController, 'comment': 'A good season'});
   
if(_emailController.text=="a@gmail.com"&& _passwordController.text=="123"
||_emailController.text=="b@gmail.com"&& _passwordController.text=="123"

){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => IntroPage()));
             

              
        }
        else {

_showToast(context);


        }},











        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Log In",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 60, 3, 1),
                    Color.fromRGBO(234, 60, 3, 1),
                    Color.fromRGBO(216, 78, 16, 1),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget loginForm = Container(
      height: 240,
      child: Stack(
        children: <Widget>[
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(200, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: 

                    TextField(
            controller : _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const  InputDecoration(
              hintText :"User Email",
              prefixIcon:  Icon(Icons.mail, color :Colors.black),
            ),
          ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child:  TextField(

            controller:  _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
              hintText :"User Password",
              prefixIcon:  Icon(Icons.lock, color :Colors.black),
            ),
            ),
                ),
              ],
            ),
          ),
          loginButton,
          RaisedButton(
            color:Colors.blue,
            child:Text(''),
            onPressed :()async{

            }
          )
          
        ],
      ),
    );

    

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'you havn\' t an account? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => RegisterPage()));
        },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );



    

    return Scaffold(

      body: Stack(
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('../../assets/background.jpg'),
                  fit: BoxFit.cover)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: transparentYellow,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                welcomeBack,
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                loginForm,
                Spacer(flex: 2),
                forgotPassword
              ],
            ),
          )
        ],
      ),
    );
  }
}
class User{
 
  final String email;
  final String pass;


  User(this.email,this.pass);

       
       
    
}

 void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Email or mot de pass Invalid '),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }