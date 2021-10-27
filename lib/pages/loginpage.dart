import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sqlite_tarea/pages/homepage.dart';
import 'package:flutter_sqlite_tarea/servicios/databaselocal.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController temail=TextEditingController();
  TextEditingController tpwd=TextEditingController();
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
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: temail,
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.emailAddress,
                  decoration: textdeco.copyWith(labelText: 'E-mail:'),
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
                  height: 40,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    child: Text(
                      'Iniciar Sesión',
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
                    onPressed: () async {
                      
                      List person = await DatabaseLocal.db.login(temail.text, tpwd.text);
                      if (person.length != 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(person[0]['nombre'])),
                        );
                      } else {
                        CustomSnackBar tipo=CustomSnackBar.error(message: 'Correo electronico o contraseña incorrectos');
                        showTopSnackBar(              
                            context,
                            tipo,
                          );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: 'No tienes una cuenta? ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: ' Registrate',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, 'registro');
                                })
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
