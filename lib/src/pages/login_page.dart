import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:huellitas/src/routes/routes.dart';
import 'package:huellitas/src/utils/constantes.dart';
import 'package:huellitas/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String correo = "";
  String contrasenia = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigo,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan.shade300,
                  Colors.cyan.shade800,
                ],
              ),
            ),
            child: Image.asset(
              "images/paw_text.png",
              color: Colors.white,
              height: 230,
            ),
          ),
          Transform.translate(
            offset: Offset(0, -80),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: "Correo: "),
                          onChanged: (newValue) {
                            setState(() {
                              correo = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Constraseña: "),
                          obscureText: true,
                          onChanged: (newValue) {
                            setState(() {
                              contrasenia = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            validarUsuario();
                          },
                          child: Text("Iniciar Sesión"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "¿No tienes una cuenta?",
                              style: TextStyle(color: Colors.black54),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: const Text(
                                "Regístrate",
                                style: TextStyle(
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, RoutePaths.registerPage);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validarUsuario() {
    if (correo.isNotEmpty && contrasenia.isNotEmpty) {
      if (contrasenia.length >= 6) {
        loginUsuario();
      } else {
        mostrarMensaje(
            context,
            "La contraseña debe tener al menos 6 caracteres.",
            Constantes.MENSAJE_ERROR);
      }
    } else {
      mostrarMensaje(
          context, "Existen campos vacíos", Constantes.MENSAJE_ERROR);
    }
  }

  Future<void> loginUsuario() async {
    try {
      showBarraProgreso(context, "Iniciando sesión");
      final loginUser = await _auth.signInWithEmailAndPassword(
          email: correo, password: contrasenia);
      Navigator.of(context).pop();
      if (loginUser != null) {
        mostrarMensaje(context, "Bienvenido.", Constantes.MENSAJE_EXITOSO);
        Navigator.pushReplacementNamed(context, RoutePaths.homePage);
      }
    } on FirebaseAuthException catch (err) {
      mostrarMensaje(context, "Error: ${err.code}", Constantes.MENSAJE_ERROR);
      Navigator.of(context).pop();
    }
  }
}
