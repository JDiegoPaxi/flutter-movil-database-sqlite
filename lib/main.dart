import 'package:flutter/material.dart';
//import 'package:flutter_sqlite_tarea/pages/list_personpage.dart';
import 'package:flutter_sqlite_tarea/pages/loginpage.dart';
//import 'package:flutter_sqlite_tarea/pages/person_registerpage.dart';
import 'package:flutter_sqlite_tarea/pages/registropage.dart';

import 'package:flutter_sqlite_tarea/servicios/databaselocal.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    DatabaseLocal.db.database;
    return MaterialApp(
      
      initialRoute: 'login',
      routes: {
       
       'login':(_)=>LoginPage(),
       'registro':(_)=>RegistroPage(),
      },
      
    );
  }
}
