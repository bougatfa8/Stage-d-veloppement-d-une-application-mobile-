import 'dart:async';
import 'dart:convert';

import 'package:app/app_properties.dart';
import 'package:app/sreens/auth/welcome_back_page.dart';
import 'package:app/profil/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
  Future<List<User>> _getUusers() async{
    var data = await http.get(Uri.parse("http://localhost:3000/school"));
    var jsonData = json.decode(data.body);
    List<User> users =[];

   
    for(var u in jsonData){
      User user = User(u["id"], u["name"], u["username"], u["email"]);
      users.add(user);
    }

    print(users.length);

    return users;


  }

  Future<List<Game>> _getGgames() async{
    var data = await http.get(Uri.parse("http://localhost:3000/school"));
    var jsonData = json.decode(data.body);
    List<Game> games =[];

   
    for(var u in jsonData){
      Game game = Game(u["scores"], u["idmachine"], u["classe"], u["level"]);
      games.add(game);
    }

    print(games.length);

    return games;


  }
  



  

String chr='';
int idr=111;
final List<String> char = <String>['Nom'];
final List<String> soc = <String>['Scores'];


class Acceuil extends StatefulWidget {
  const Acceuil({ Key? key }) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  get parse => null;



 

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
               
            Pustom(Icons.person,'Ahmed bougatf'),
            Pustom(Icons.mail,'dreamdev8@gmail.com'),
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
                  itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(4.0),
            child: Material(
            
                                 

              elevation: 4.0,
              borderRadius: BorderRadius.circular(5.0),
              color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
             child:TextButton(
  style: ButtonStyle(
    
  
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  
  ),
  onPressed: () {

 Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));

   },
  child:  Text(   "ID :"+snapshot.data[index].id+"               name:" +  snapshot.data[index].name +"                          username:"+snapshot.data[index].username+'               Email :'+snapshot.data[index].email ),
)

               
              ),
                  ),
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
  final String id;
  final String name;
  final String username;
  final String email;


  User(this.id,this.name,this.username,this.email);

       
       
    
}
class Game{
  final String scores;
  final String idmachine;
  final String classe;
  final String level;


  Game(this.scores,this.idmachine,this.classe,this.level);

       
       
    
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












   











