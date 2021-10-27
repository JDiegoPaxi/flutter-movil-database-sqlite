import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite_tarea/models/persona_model.dart';
import 'package:flutter_sqlite_tarea/servicios/databaselocal.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({Key? key}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {

  TextEditingController tname=TextEditingController();
  TextEditingController tpwd=TextEditingController();
  TextEditingController temail=TextEditingController();
  TextEditingController ttelf=TextEditingController();
  TextEditingController tdir=TextEditingController();
  TextEditingController tpwdc=TextEditingController();

  InputDecoration textdeco = InputDecoration(
      labelStyle: TextStyle(
          fontSize: 15, color: Color(0xff1e319d), fontWeight: FontWeight.bold));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Registro',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: tname,
                  style: TextStyle(fontSize: 20),
                  decoration: textdeco.copyWith(labelText: 'Nombre:'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: temail,
                  decoration: textdeco.copyWith(labelText: 'E-mail:'),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ttelf,
                  decoration: textdeco.copyWith(labelText: 'Telefono:'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: tdir,
                  decoration: textdeco.copyWith(labelText: 'Dirección:'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: tpwd,
                  obscureText: true,
                  decoration: textdeco.copyWith(labelText: 'Contraseña:'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: tpwdc,
                  obscureText: true,
                  decoration: textdeco.copyWith(labelText: 'Confirma tu contraseña:'),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    child: Text(
                      'Crear Cuenta',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                        primary: Color(0xff1e319d),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    onPressed: () async{
                      CustomSnackBar tipo;
                      if(!await DatabaseLocal.db.existe(temail.text)){
                        print('no hay');
                        DatabaseLocal.db.crearPersona(new Persona(nombre: tname.text, password: tpwd.text, email: temail.text, telefono: ttelf.text, direccion: tdir.text));
                        tipo=CustomSnackBar.success(message: 'Registro realizado exitosamente');
                         
                      }else{
                        DatabaseLocal.db.listarPersonas();
                        tipo=CustomSnackBar.error(message: 'Ya existe un usuario registrado con ese correo');
                      }
                      showTopSnackBar(              
                            context,
                            tipo,
                          );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  child: RichText(
                    
                    text: TextSpan(text: 'Ya tienes una cuenta? ', 
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: ' Inicia sesión',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(context, 'login');
                            })
                    ]),
                  ),
                ),
                 SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}