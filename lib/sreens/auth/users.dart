import 'dart:async';
import 'dart:convert';

import 'package:app/app_properties.dart';
import 'package:app/sreens/auth/welcome_back_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
  Future<List<User>> _getUusers() async{
    var data = await http.get(Uri.parse("https://jsonformatter.org/json-editor/9aef5a"));
    var jsonData = json.decode(data.body);
    List<User> users =[];
    for(var u in jsonData){
      User user = User(u["email"], u["email"], u["pass"], u["pass"]);
      users.add(user);
    }

    print(users.length);

    return users;


  }



  

String chr='';
int idr=111;
final List<String> char = <String>['Nom'];
final List<String> soc = <String>['Scores'];


class Users extends StatefulWidget {
  const Users({ Key? key }) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Users> {
final List<String> entries = <String>['Nom et Pr','Jamila kahla','Salem bougatf','Ahmed bougatf', 'aladdin  ala', 'sami boussaa','rami welfrajj','Jamila kahla','Salem bougatf','Ahmed bougatf', 'aladdin  ala', 'sami boussaa','rami welfrajj'];
final List<int> colorCodes = <int>[600, 300];
final List<String> scores=<String>['Scores','1800','1500','1400','500','888','500','888','100','300','400','500','888','500','888'];



 

 @override
  Widget build(BuildContext context) {
  
    return  
    
     Scaffold(
          appBar :AppBar(
        title: Text ('                                               SCHOOL APP'),
        
        backgroundColor: Colors.deepOrange,
      ),
      
    
      drawer :Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children :<Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors :<Color>[
                  Colors.deepOrange,
                  Colors.orangeAccent
                ])
              ),
            

             
              child: Container(
                child :Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Padding(padding: EdgeInsets.all(8.0),
                    
                      
                     child : Image.asset('../../assets/logo.png', width: 100,height: 100,)
                     
                     
                    
                     ),
                     

                      )
                  ],
                )
             ) ),
               
            Pustom(Icons.person,'Profile'),
            Pustom(Icons.mail,'Mail'),
            Pustom(Icons.notification_add,'Settings'),
            Custom(Icons.lock,'log out',()=>{}
             
            )
         
 
          ]
        ),
      ),

  
      body: Container(
        child: FutureBuilder(
          future: _getUusers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text('Loading'),
                ),
              );
            }else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      
                     
      
                      title: Text( snapshot.data[index].email+'            '+snapshot.data[index].pass ),
                      subtitle: Text(''+snapshot.data[index].email),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(snapshot.data[index])));
                      },
                    );
                  }
              );
            }



          },
        ),
      ),

    );
  }
}

class DetailPage extends StatelessWidget {
  final User user;
  DetailPage(this.user);
  @override
  Widget build(BuildContext context) {
   

     Widget subTitle = Padding(
        padding: const EdgeInsets.only(left: 300.0,top: 200),
        child: Text('Email :'+
          user.email +
          'Description:'
          ,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            
            
          ),
        ));  

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
                
                subTitle,
             
              ],
            ),
          )
        ],
      ),
    );
         
    
       
    
      
    
  }
}


class User{
  final int id;
  final String name;
  final String username;
  final String email;


  User(this.id,this.name,this.username,this.email);

       
       
    
}

     class Custom extends StatelessWidget{
  IconData icon;
  String text;
  Function onTap ;
 
  

Custom(this.icon,this.text,this.onTap);
//TODO: implement build

  @override
  Widget build(BuildContext context){
   
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border :Border(bottom:BorderSide(color: Colors.grey.shade400) )
        ),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap:()=>{Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => WelcomeBackPage()))},
child:Container(
  height: 60,
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    children: <Widget>[
  
  Row(
  
  children: <Widget>[
  
              Icon(icon),
  
          Padding(
  
            padding: const EdgeInsets.all(8.0),
  
            child: Text(text,style: TextStyle(
  
              fontSize: 16.0
  
            ),),
  
          ),
  
  ],
  
  ),
  
          Icon(Icons.arrow_right)
  
    ],
  
  ),
)
        ),
      ),
    );
  }
}

class Pustom extends StatelessWidget{
  IconData icon;
  String text;
 
  

Pustom(this.icon,this.text);
//TODO: implement build

  @override
  Widget build(BuildContext context){
   
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border :Border(bottom:BorderSide(color: Colors.grey.shade400) )
        ),
        child: InkWell(
          splashColor: Colors.orangeAccent,
        
child:Container(
  height: 60,
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    children: <Widget>[
  
  Row(
  
  children: <Widget>[
  
              Icon(icon),
  
          Padding(
  
            padding: const EdgeInsets.all(8.0),
  
            child: Text(text,style: TextStyle(
  
              fontSize: 16.0
  
            ),),
  
          ),
  
  ],
  
  ),
  
          
  
    ],
  
  ),
)
        ),
      ),
    );
  }
}



