import 'package:flutter/material.dart';
import 'package:proyecto/usuario/principal.dart';
import 'package:proyecto/usuario/formulario.dart';


class Navegador extends StatefulWidget {
  const Navegador({super.key});

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador> {
  int _p = 0;

  final List<Widget> _pantallas = [
    const MyHomePage(title: "Pantalla Principal"),
    const Formulario(title: "Formulario"),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _p,
        onTap: _cambiarPantalla,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Principal"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_outlined), label: "Formulario"
          ),
        ],
      ),
    );
  }
}
