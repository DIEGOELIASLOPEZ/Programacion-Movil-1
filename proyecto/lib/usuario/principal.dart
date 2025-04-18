import 'package:flutter/material.dart';
import 'package:proyecto/authentication/login.dart';
import 'package:proyecto/authentication/siginup.dart';
import 'package:proyecto/source/navegador.dart';
import 'package:proyecto/usuario/formulario.dart';
import 'package:proyecto/usuario/verDenuncias.dart';


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
      appBar: AppBar(
        backgroundColor: Color(0XFFFEF7FF),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFFFEF7FF), // Fondo personalizado
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                height: 70,
                color: Color(0XFFFEF7FF),
                onPressed: () {
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.logout, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      "Cerrar Sesión",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

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
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.9, // 90% del ancho de pantalla
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: const Color(0XFF2668DF),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Formulario()),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.description, color: Color(0XFFFEF7FF), size: 24),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Crear Denuncia",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0XFFFEF7FF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: const Color(0XFF2668DF),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DenunciasScreen()),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.folder, color: Color(0XFFFEF7FF), size: 24),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Ver Mis Denuncias",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0XFFFEF7FF),
                                ),
                              ),
                            ),
                          ],
                        ),
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