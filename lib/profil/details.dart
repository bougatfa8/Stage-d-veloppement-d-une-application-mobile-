import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:app/app_properties.dart';
import 'package:app/profil/acceuil.dart';
import 'package:app/sreens/auth/welcome_back_page.dart';
import 'package:app/profil/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
  Future<List<User>> _getUusers() async{
    var data = await http.get(Uri.parse("http://localhost:3000/eleve"));
    var jsonData = json.decode(data.body);
    List<User> users =[];

   
    for(var u in jsonData){
      User user = User(u["id"], u["name"], u["username"], u["email"]);
      users.add(user);
    }

    print(users.length);

    return users;


  }

  




  



class Details extends StatefulWidget {
  const Details({ Key? key }) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Details> {
  get parse => null;



  int x=Random().nextInt(34);

 @override
  Widget build(BuildContext context) {
  
    return  
    
     Scaffold(
          appBar :AppBar(
        title: Text ('                                               Nombre de Partie :${x} ' ),
        
               actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the next page',
            onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Acceuil()));
            },
          ),
        ],
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
              
                  itemCount:  x,
                  itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(4.0),
            child: Material(
            
                                 

              elevation: 4.0,
              borderRadius: BorderRadius.circular(5.0),
              color: index % 2 == 0 ? Colors.black12 : Colors.black12,
             child:TextButton(
  style: ButtonStyle(
    
  
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  
  ),
  onPressed: () {


   },
  child:  Text(   "ID machine:"+snapshot.data[index].id+"               Scores:" +  snapshot.data[index].name +"                          Date::"+snapshot.data[index].username+'               level :'+snapshot.data[index].email ),
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




