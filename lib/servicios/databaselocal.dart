
import 'dart:io';
import 'package:flutter_sqlite_tarea/models/persona_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocal{

static Database ?_database;
static final DatabaseLocal db=DatabaseLocal._();

DatabaseLocal._();


Future <Database?> get database async{
 if(_database!= null) return _database;
 _database=await initDB();
 print('get database');
 print(_database);
 return _database;
}

Future<Database?>initDB()async{
  Directory documentsDirectory=await getApplicationDocumentsDirectory();
  final path=join(documentsDirectory.path,'topicostarea.db');
  print(path);

  return await openDatabase(
    path,
    version: 3,
    onCreate: (Database db,int version)async{
     await db.execute('''
      CREATE TABLE PERSONA(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        password TEXT NOT NULL,
        
        email TEXT NOT NULL,
        telefono INT,
        direccion TEXT
      );
     ''');
    }
  );
}

crearPersona(Persona p)async{
 final name=p.nombre;
 final pwd=p.password;
 final email=p.email;
 final telf=p.telefono;
 final dir=p.direccion;
 final db=await database;
 print(p);
 /*final res=await db!.rawInsert('''
   INSERT INTO PERSONA(nombre,apellido_pat,apellido_mat,email,telefono,direccion)
   VALUES('$name','$apepat','$apemat','$email','$email',$telf,'$dir')
 '''); */
 //final res=await db!.insert('PERSONA', p.toJson());

 final res=await db!.rawInsert('INSERT INTO PERSONA(nombre,password,email,telefono,direccion) VALUES ("$name","$pwd","$email","$telf","$dir")');
 
 print(res);

 return res;
}

Future<bool>existe(String email)async{
 
 
 
 final db=await database;

 List<Map> resp=await db!.rawQuery('select * from PERSONA where("$email"=PERSONA.email)');
 
 print(resp);
 

 return resp.length!=0;
}

Future<List<Map>>login(String email,String pwd)async{
final db=await database;

 List<Map> resp=await db!.rawQuery('select * from PERSONA where("$email"=PERSONA.email and "$pwd"=PERSONA.password)');
 
 return resp;
}

Future<List<Map>>listarPersonas()async{
 final db=await database;
 List<Map> resp=await db!.rawQuery('select * from PERSONA;');
 
 return resp;
}


}