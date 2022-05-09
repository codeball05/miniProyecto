import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:huellitas/src/routes/routes.dart';
import 'package:huellitas/src/utils/constantes.dart';
import 'package:huellitas/src/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                          child: Text("Registrarse"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "¿Ya tienes una cuenta?",
                              style: TextStyle(color: Colors.black54),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                child: const Text(
                                  "Iniciar Sesión",
                                  style: TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, RoutePaths.loginPage);
                                }),
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
        registrarUsuario();
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

  Future<void> registrarUsuario() async {
    try {
      showBarraProgreso(context, "Registrando");
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: correo, password: contrasenia);
      Navigator.of(context).pop();
      if (newUser != null) {
        mostrarMensaje(context, "Registro exitoso", Constantes.MENSAJE_EXITOSO);
        Navigator.pushReplacementNamed(context, RoutePaths.loginPage);
      }
    } on FirebaseAuthException catch (err) {
      mostrarMensaje(context, "Error: ${err.code}", Constantes.MENSAJE_ERROR);
      Navigator.of(context).pop();
    }
  }
}
