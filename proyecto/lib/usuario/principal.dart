import 'package:flutter/material.dart';
import 'package:proyecto/authentication/login.dart';
import 'package:proyecto/authentication/siginup.dart';
import 'package:proyecto/source/navegador.dart';
import 'package:proyecto/usuario/formulario.dart';


class PrincipalUsuario extends StatefulWidget {
  const PrincipalUsuario({super.key, required this.title});

  final String title;

  @override
  State<PrincipalUsuario> createState() => _PrincipalUsuarioState();
}
class _PrincipalUsuarioState extends State<PrincipalUsuario> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/UsuarioSimbolo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: const <Widget>[
                    Text(
                      "Bienvenido",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      "nombre del usuario",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 10),
                    const SizedBox(height: 10),
                    Text(
                      "Panel General - Crea o Revisa tus Denuncias",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  children: <Widget>[
                    FractionallySizedBox(
                      widthFactor: 0.46, // 80% del ancho disponible
                      child: MaterialButton(
                          height: 70,
                          color: Color(0XFF2668DF),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Formulario()));
                          },
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Icon(Icons.description,color: Color(0XFFFEF7FF),size: 30,),
                              SizedBox( width: 10,),
                              Text(
                                "Crear Denuncia",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0XFFFEF7FF)
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    const SizedBox(height: 50),

                    FractionallySizedBox(
                      widthFactor: 0.46, // 80% del ancho disponible
                      child: MaterialButton(
                        height: 70,
                        color: Color(0XFF2668DF),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Icon(Icons.folder,color: Color(0XFFFEF7FF),size: 30,),
                              SizedBox( width: 10,),
                              Text(
                                "Ver Mis Denuncias",
                                style: TextStyle(
                                  fontSize: 30,
                                    color: Color(0XFFFEF7FF)
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    const SizedBox(height: 200),
                    FractionallySizedBox(
                      widthFactor: 0.36, // 80% del ancho disponible
                      child: MaterialButton(
                        height: 70,
                        color: Color(0XFFFEF7FF),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            Icon(Icons.logout),
                            SizedBox( width: 10,),
                            Text(
                              "Cerrar Sesion",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}