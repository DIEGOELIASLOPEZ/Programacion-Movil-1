import 'package:flutter/material.dart';
import 'package:proyecto/authentication/siginup.dart';
import 'package:firebase_core/firebase_core.dart';


class Login extends StatelessWidget {
  TextEditingController curp = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        // brightness: Brightness. light,
        // backgroundColor: Colors.white,
        leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
          size:20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget> [
                    Text("Inciar Sesion",
                    style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Inicia Sesion con tu CURP",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700]),),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        inputField(label: "CURP"),
                        inputField(label: "Contraseña", obscureText: true),
                      ],
                    ),
                ),
                    Padding(padding:
                    EdgeInsets.symmetric(horizontal: 40),
                      child:
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black), // puedes simplificarlo así
                        ),
                        child: FractionallySizedBox(
                          widthFactor: 0.9, // 90% del ancho del contenedor
                          child: MaterialButton(
                            height: 60,
                            onPressed: () {
                            },
                            color: const Color(0XFF2668DF),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "Iniciar Sesión",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("¿No tienes cuenta? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SiginUp()),
                        );
                      },
                      child: Text(
                        "Regístrate",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/login.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),


              ],
            ),
            ),
          ],
        ),
      ),
    );
  }

}


Widget inputField({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,
          horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}

