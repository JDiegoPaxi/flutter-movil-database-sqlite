import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  final String nombre;
  HomePage(this.nombre);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Color(0xff1e319d),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenido',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff1e319d),fontSize: 40),),
            Text(widget.nombre,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}