
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_sqlite_tarea/models/persona_model.dart';
//import 'package:flutter_sqlite_tarea/provider/databaselocal.dart';
//import 'package:top_snackbar_flutter/custom_snack_bar.dart';
//import 'package:top_snackbar_flutter/top_snack_bar.dart';
//import 'package:flutter_sqlite_tarea/provider/databaselocal.dart';

class PersonRegisterPage extends StatefulWidget {
  PersonRegisterPage({Key ?key}) : super(key: key);

  @override
  _PersonRegisterPageState createState() => _PersonRegisterPageState();
}

class _PersonRegisterPageState extends State<PersonRegisterPage> {
  final tname=GlobalKey<FormFieldState>();
  final tappa=GlobalKey<FormFieldState>();
  final tapmat=GlobalKey<FormFieldState>();
  final temail=GlobalKey<FormFieldState>();
  final ttelf=GlobalKey<FormFieldState>();
  final tdir=GlobalKey<FormFieldState>();
  
  
  String ?nombre='';
  String ?appat='';
  String ?apmat='';
  String ?email='';
  String ?telef='';
  String ?direc='';

  

  TextStyle st1=TextStyle(color: Colors.white);
  final _keyForm=GlobalKey<FormState>();

  InputDecoration dec1=InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 20.0),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2.0),borderRadius: BorderRadius.circular(20.0)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow,width: 3.0),borderRadius: BorderRadius.circular(20.0)),
                      hoverColor: Colors.yellow, 
                      errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2.0),borderRadius: BorderRadius.circular(20.0)), 
                      labelText: ''  ,
                      
                      
                      
                      focusedErrorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0),borderRadius: BorderRadius.circular(20.0)),                                
                    );


  @override
  Widget build(BuildContext context) {
    
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('Registro de Persona'),
           backgroundColor: Colors.orange[600],
         ),
         body: SingleChildScrollView(
           child: Form(
             key: _keyForm,
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 
                children: [

                  Text('DATOS PERSONALES',textScaleFactor: 1.5,style: st1,),
                  SizedBox(height: 20,),
                  Text('Nombre(s):',style: st1,),                  
                  SizedBox(height: 10,),

                  TextFormField(
                    key: tname,                   
                    maxLength: 30,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp ( r"[a-zA-Z ]" ))
                    ],
                    autofocus: true,
                    cursorColor: Colors.white,                    
                    style: TextStyle(color:Colors.white,fontSize: 20),
                    decoration: dec1,
                    
                    validator: (valor){
                      
                      if(valor==null) return 'No puede quedar vacio el campo, no puede quedar vacío.';   
                      if(valor.length<3) return 'El nombre debe contener al menos 3 caracteres';
                      
                      return null; 
                    },
                    onSaved: (valor){
                      
                      nombre=valor;
                    },
                    onChanged: (valor){
                      
                      tname.currentState!.validate();                                                                                   
                    },

                  ),
                  SizedBox(height: 20,),

                  Text('Apellido Paterno:',style: st1,),
                  SizedBox(height: 10,),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    key: tappa,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp ( r"[a-zA-Z ]" ))
                    ],
                    maxLength: 20,
                    cursorColor: Colors.white,                    
                    style: TextStyle(color:Colors.white,fontSize: 20),
                    decoration: dec1,
                    validator: (valor){
                      
                      if(valor==null){
                        return 'Debe llenar el campo';
                      }
                      if(valor.length<3) return 'El campo  debe contener al menos 3 caracteres.';
                      return null;
 
                    },
                    onSaved: (valor){
                     
                      appat=valor;
                    },
                    onChanged: (valor){
                     
                      tappa.currentState!.validate();                                              
                    },

                  ),
                  SizedBox(height: 20,),
                  Text('Apellido Materno:',style: st1,),
                  SizedBox(height: 10,),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp ( r"[a-zA-Z ]" ))
                    ],
                    maxLength: 20,
                    key: tapmat,
                    cursorColor: Colors.white,                    
                    style: TextStyle(color:Colors.white,fontSize: 20),
                    decoration: dec1,
                    validator: (valor){
                      if(valor==null){
                        return 'No puede quedar vacio el campo.';
                      }
                      if(valor.length<3) return 'El campo  debe contener al menos 3 caracteres';
                    },
                    onChanged: (valor){
                      tapmat.currentState!.validate();
                    },
                    onSaved: (valor)=>apmat=valor,

                  ),
                  SizedBox(height: 20,),
                  Text('E-mail:',style: st1,),
                  SizedBox(height: 10,),
                  TextFormField(
                    maxLength: 40,
                    key: temail,
                    cursorColor: Colors.white,                    
                    style: TextStyle(color:Colors.white,fontSize: 20),
                    decoration: dec1,
                    keyboardType: TextInputType.emailAddress,
                    validator: (valor){
                      
                      if(valor==null) return 'Debe llenar este campo';
                      if(valor.length<=0) return 'Debe llenar este campo';
                      RegExp exp=RegExp(r"^([a-zA-Z0-9\._])+@([a-zA-Z])+\.com$");
                      if(!exp.hasMatch(valor)) return 'Correo electronico no valido.';
                      return null;
                    },
                    onChanged: (valor){
                      temail.currentState!.validate();
                    },
                    onSaved: (valor)=>email=valor,

                  ),
                  SizedBox(height: 20,),
                  Text('Telefono:',style: st1,),
                  SizedBox(height: 10,),
                  TextFormField(
                    maxLength: 8,
                    key: ttelf,
                    cursorColor: Colors.white,                    
                    style: TextStyle(color:Colors.white,fontSize: 20),
                    decoration: dec1,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    validator: (valor){
                      
                      if(valor==null){
                       return 'Debe llenar el campo, no puede quedar vacío.';
                      }
                      if(valor.isEmpty){
                        return 'Debe llenar el campo, no puede quedar vacío.';
                      }
                      
                      if(valor.length<8) return 'Numero telefonico incorrecto.';
                      return null;
                    },
                    onSaved: (valor){
                      
                       telef=valor;

                    },
                    onChanged: (valor){
                      
                      if(valor.length<=8){
                         ttelf.currentState!.validate();

                      }

                    },
                    

                  ),
                  SizedBox(height: 20,),
                  Text('Direccion:',style: st1,),
                  SizedBox(height: 10,),
                  TextFormField(
                    maxLength: 40,
                    key: tdir,
                    cursorColor: Colors.white,                    
                    style: TextStyle(color:Colors.white,fontSize: 20),
                    decoration: dec1,
                    validator: (valor){
                      if(valor==null) return 'Debe llenar el campo, no puede quedar vacío.';
                      if(valor.length==0) return 'Debe llenar el campo, no puede quedar vacío.';
                    },
                    onChanged: (valor){
                      tdir.currentState!.validate();
                    },
                    onSaved: (valor)=>direc=valor,

                  ),
                  SizedBox(height: 40,),

                  Container(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                     
                      
                      child: Text('Registrar',style: TextStyle(fontSize: 18),),
                      style: ElevatedButton.styleFrom(
                      
                        side: BorderSide(color: Colors.white),
                        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                        primary: Colors.orange,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      ),
                      
                      onPressed: ()async{
                        /*
                        CustomSnackBar tipo;

                        if(_keyForm.currentState!.validate()){
                          print('validado');
                          _keyForm.currentState!.save();
                          //Persona p=new Persona(nombre:nombre,appat: appat,apmat: apmat,email: email,telefono: int.parse(telef!),direccion: direc);
                          if(await DatabaseLocal.db.busqueda(p)){
                             tipo=CustomSnackBar.error(message: 'No se puede registrar, porque ya se encuentra registrado');

                          }else{
                             
                             //await DatabaseLocal.db.crearPersona(p);
                             tipo=CustomSnackBar.success(message: 'Registro correctamente realizado');
                             Navigator.pop(context);
                            

                          }
                          
                          showTopSnackBar(              
                            context,
                            tipo,
                          );
                          
                        }*/
                      }, 
                      
                    ),
                  )
                ],

               ),
             ),
           ),
         ),
         backgroundColor: Colors.black,
       ),
    );
  }
 
  

  
}