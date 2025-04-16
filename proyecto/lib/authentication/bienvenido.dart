import 'package:flutter/material.dart';
import 'package:proyecto/authentication/login.dart';
import 'package:proyecto/authentication/siginup.dart';
import 'package:proyecto/source/navegador.dart';
class Bienvenido extends StatefulWidget {
  const Bienvenido({super.key, required this.title});

  final String title;

  @override
  State<Bienvenido> createState() => _BienvenidoState();
}
class _BienvenidoState extends State<Bienvenido> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Bienvenido",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Sistema de Denuncias de incidentes en la Colinia Gotica ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/Bienvenido-Imagen.png")
                    )
                  ),
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 150,
                      height: 60,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text(
                        "Inicar Sesion",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                        ),
                      ),
                      
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      minWidth: 150,
                      height: 60,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SiginUp()));
                      },
                      color: Color(0XFF2668DF),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text(
                        "Registrarse",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18

                        ),
                      ),

                    ),
                  ],
                  
                ),


              ],
            ),
            
          )),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
