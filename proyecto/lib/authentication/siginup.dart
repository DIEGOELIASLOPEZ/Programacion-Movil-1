import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto/authentication/bienvenido.dart';

class SiginUp extends StatefulWidget {
  @override
  _SiginUpState createState() => _SiginUpState();
}

class _SiginUpState extends State<SiginUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> registrarUsuario({
    required String email,
    required String password,
  }) async {
    try {
      // Intentamos registrar al usuario
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Obtenemos el usuario creado
      User? user = userCredential.user;

      if (user != null) {
        // El usuario fue creado correctamente, ahora subimos los datos a Firestore
        await FirebaseFirestore.instance
            .collection("usuario")
            .doc(user.uid) // Usamos el UID para identificar al usuario en Firestore
            .set({
          'email': email,
        });

        // Mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Usuario Registrado Exitosamente")),
        );

        // Limpiar campos después de éxito
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        // Redirigir a la pantalla de Bienvenido
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Bienvenido(title: "Inicio")),
        );
      } else {
        print('Error: Usuario no creado correctamente.');
        return;
      }
    } on FirebaseAuthException catch (e) {
      // Captura el error de FirebaseAuth
      print('Error en registro: Código: ${e.code}, Mensaje: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al registrar usuario: ${e.message}")),
      );
    } catch (e) {
      // Captura cualquier otro error
      print('Error no controlado: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al registrar usuario: $e")),
      );
    }
  }


  void validarYRegistrar() async {
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();
    final confirmPass = confirmPasswordController.text.trim();

    if ([email, pass, confirmPass].any((e) => e.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor completa todos los campos")),
      );
      return;
    }

    if (pass != confirmPass) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Las contraseñas no coinciden")),
      );
      return;
    }

    await registrarUsuario(email: email, password: pass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Registro",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: <Widget>[
                            inputField(label: "Correo Electronico", controller: emailController),
                            inputField(label: "Contraseña", obscureText: true, controller: passwordController),
                            inputField(label: "Confirmar Contraseña", obscureText: true, controller: confirmPasswordController),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black),
                          ),
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: MaterialButton(
                              height: 60,
                              onPressed: validarYRegistrar,
                              color: const Color(0XFF2668DF),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Text(
                                "Registrarse",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget inputField({required String label, bool obscureText = false, required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 5),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
