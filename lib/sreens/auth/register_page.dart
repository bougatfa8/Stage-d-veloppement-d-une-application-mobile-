import 'package:app/app_properties.dart';
import 'package:app/profil/acceuil.dart';
import 'package:app/sreens/auth/registed.dart';
import 'package:app/sreens/auth/welcome_back_page.dart';
import 'package:flutter/material.dart';

  

import '../intro_page.dart';

//import 'forgot_password_page.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
TextEditingController nom =
      TextEditingController();
      TextEditingController prenom =
      TextEditingController();
      TextEditingController classe =
      TextEditingController();
      TextEditingController age =
      TextEditingController();


  
  TextEditingController email =
      TextEditingController();
     

  TextEditingController password = TextEditingController();

  TextEditingController cmfPassword = TextEditingController();
final List<String> mail = <String>[];
final List<String> pass =<String>[];


  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Glad To Meet You',
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
          'Create your new account for future uses.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: -0,
      child: InkWell(
        onTap: () {
           mail.add('$email');
           pass.add('$pass');
           if(cmfPassword.text.isEmpty){
             _showToastEmail(context);
           }
         
           else{
  _showToast(context);
           
            Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Registed()));
        




         ;}
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Register",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              gradient: mainButton,
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

    Widget registerForm = Container(
      height: 450,
      child: Stack(
        children: <Widget>[
          Container(
            height: 420,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //Nom
                       Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                       decoration: InputDecoration(
    hintText: 'Nom'
  ),
                    controller: nom,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                //Prénom

                       Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                       decoration: InputDecoration(
    hintText: 'Prénom'
  ),
                    controller: prenom,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
       
                       Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                       decoration: InputDecoration(
    hintText: 'Classe'
  ),
                    controller: classe,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                       Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                       decoration: InputDecoration(
    hintText: 'Age'
  ),
                    controller: age,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),

                         Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                       decoration: InputDecoration(
    hintText: 'Email@gmail.com'
  ),
                    controller: email,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                          decoration: InputDecoration(
    hintText: 'password'
  ),
                    controller: password,
                    

                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                       decoration: InputDecoration(
    hintText: ' Confirmer password'
  ),
                    controller: cmfPassword,
                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          registerButton,
        ],
      ),
    );

    Widget socialRegister = Column(
      children: <Widget>[
        Text(
          'You can sign in with',
          style: TextStyle(
              fontSize: 12.0, fontStyle: FontStyle.italic, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.find_replace),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
                icon: Icon(Icons.find_replace),
                onPressed: () {},
                color: Colors.white),
          ],
        )
      ],
    );

    return Scaffold(

              body: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/background.jpg'),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Spacer(flex:3),
                        title,
                        Spacer(),

                        subTitle,
                        Spacer(flex:2),

                        registerForm,
                        Spacer(flex:2),
                        Padding(
                            padding: EdgeInsets.only(bottom: 20), child: socialRegister)
                      ],
                    ),
                  ),

                  Positioned(
                    top: 35,
                    left: 5,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            );
  }
}
void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('You have registred '),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showToastEmail(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Email or mots de Password Invalid ! '),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  