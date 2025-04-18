import 'package:flutter/material.dart';
import 'package:proyecto/usuario/principal.dart';
import 'package:proyecto/usuario/formulario.dart';
import 'package:proyecto/usuario/verDenuncias.dart';
import 'package:proyecto/admin/principal.dart';
import 'package:proyecto/authentication/bienvenido.dart';
import 'package:proyecto/authentication/login.dart';
import 'package:proyecto/authentication/siginup.dart';



class Navegador extends StatefulWidget {
  const Navegador({super.key});

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador> {
  int _p = 2;

  final List<Widget> _pantallas = [
    const Bienvenido(title: "Bienvenido"), // 0
    Login(), // 1
    SiginUp(), // 2
    const PrincipalUsuario(title: "Pantalla Principal"), // 3
    Formulario(), // 4
    DenunciasScreen(), // 5
    PrincipalAdmin(), // 6
  ];

  void _cambiarPantalla(int index) {
    setState(() {
      _p = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pantallas[_p],
    );
  }
}