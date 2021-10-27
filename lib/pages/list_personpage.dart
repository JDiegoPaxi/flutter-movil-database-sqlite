import 'package:flutter/material.dart';
//import 'package:flutter_sqlite_tarea/provider/databaselocal.dart';


class ListPersonPage extends StatefulWidget {
  ListPersonPage({Key? key}) : super(key: key);

  @override
  _ListPersonPageState createState() => _ListPersonPageState();
}

class _ListPersonPageState extends State<ListPersonPage> {
  List<Map> ?person;
  
  @override
  Widget build(BuildContext context) {
    
     
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('Lista de personas'),
           backgroundColor: Colors.orange[600],
         ),
         body: Center(
           child: FutureBuilder(

            // future: DatabaseLocal.db.listarPersonas(),
             initialData: [],
             builder: (context,AsyncSnapshot<List<dynamic>>snapshot){
               
               return _listaPersonas(snapshot.data);
             },
            
           ),
         ),
         floatingActionButton: FloatingActionButton(
           child: Icon(Icons.person_add),
           onPressed: (){
             Navigator.pushNamed(context, 'addpersona').then(
               (value) => setState(() {}));
             
           },
           backgroundColor: Colors.orange,
         ),
         backgroundColor: Colors.black,
       ),
    );
  }

  

  Widget _listaPersonas(List<dynamic>?persona){
    TextStyle tx=TextStyle(color: Colors.white);
    return ListView.builder(
               padding: EdgeInsets.only(bottom: 30,top: 30,left: 20),
               itemCount: persona!.length,
               itemBuilder: (context,index){
                 return Container(
                   height: 140,
                   width: 60,
                   margin: EdgeInsetsDirectional.only(top: 10,bottom: 10),
                   child: Card(
                     
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0),topLeft: Radius.circular(50.0))),
                    child:Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        
                        Container(
                          child: Icon(Icons.person,size: 100,)),
                        Expanded(
                          child: Container(
                            color: Colors.redAccent[700],
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(persona[index]['nombre'],textScaleFactor: 1.5,style: tx,),
                                Text('${persona[index]['apellido_pat']} ${persona[index]['apellido_mat']}',textScaleFactor: 1.5,style: tx,),
                                Text('${persona[index]['telefono']}',textScaleFactor: 1.2,style: tx,),
                                Text(persona[index]['email'],textScaleFactor: 1.0,style: tx,),
                                Text(persona[index]['direccion'],textScaleFactor: 1.0,style: tx,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    color: Colors.orange[900],
           
                   ),
                 );
           
               }
               
               );


  }
}