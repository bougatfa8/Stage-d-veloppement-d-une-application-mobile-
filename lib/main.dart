import 'dart:io';

import 'package:app/profil/acceuil.dart';
import 'package:app/sreens/auth/register_page.dart';
import 'package:app/sreens/auth/users.dart';
import 'package:flutter/material.dart';
import 'package:app/sreens/splach_page.dart';
import 'package:http/http.dart' as http;

void main() async{

//WidgetsFlutterBinding.ensureInitialized();
//add firebase initialize


 runApp(MyApp());
}
/*
getMethod() async{

var url = Uri.parse('https://192.168.1.12/data/game.php');
var response = await http.post(url);
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read(Uri.parse('https://example.com/foobar.txt')));
}
*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 

    MaterialApp(
      title: 'Professeur',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      
     home: SplashScreen
     
     
     ());
  }}
     
     /*
     body : FutureBuilder(
     future: getMethod() ,
     builder : (BuildContext context, AsyncSnapshot snapshot){
     List snap =snapshot.data;
     if (snapshot.connectionState == ConnectionState.waiting){
     return  Center(
     child : CircularProgressIndicator(),
     );
     
     
     }
      if (snapshot.connectionState == ConnectionState.waiting){
     return  Center(
     child : CircularProgressIndicator(),
     );
     
     
     }

     return ListView.builder(
     
     itemCount : snap.length,
     itemBuilder : (context,index){
     return ListTile(
     title: Text("head : ${snap[index]['heading']}"),
     subtitle : Text("body ${snap[index]['body']}"),
     );
     }

     
     );
     
     },

     )
    );
     
    }}
    */
 