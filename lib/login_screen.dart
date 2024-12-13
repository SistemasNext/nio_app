import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'register_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controladores de texto
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/fondo-pantalla.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/img/Logo-NIO.png',
                  height: 120,
                ),
                const SizedBox(height: 20),
                // Contenedor del formulario
                Container(
                  padding: const EdgeInsets.all(20.0),
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'INICIAR SESIÓN',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF9800),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Campo de correo
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFFFF9800),
                          ),
                          labelText: 'Correo electrónico',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF9800),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                      const SizedBox(height: 20),
                      // Campo de contraseña
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFFFF9800),
                          ),
                          labelText: 'Contraseña',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFF9800),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                      const SizedBox(height: 20),
                      // Botón Entrar
                      Builder(
                        builder: (BuildContext newContext) {
                          return ElevatedButton(
                            onPressed: () async {
                              // Validar campos vacíos
                              if (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Por favor, complete todos los campos.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }
                              // Mostrar el diálogo de carga
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'Iniciando Sesión',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              final authProvider = Provider.of<AuthProvider>(
                                  context,
                                  listen: false);

                              await authProvider.login(
                                emailController.text,
                                passwordController.text,
                              );

                              // ignore: use_build_context_synchronously
                              Navigator.of(newContext)
                                  .pop(); // Cerrar el diálogo de carga

                              if (authProvider.status == Status.Authenticated) {
                                // Navegar al menú principal
                                Navigator.pushReplacementNamed(
                                    // ignore: use_build_context_synchronously
                                    newContext,
                                    '/menu');
                              } else {
                                //Limpiar campos
                                emailController.clear();
                                passwordController.clear();
                                // Mostrar mensaje de error
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(newContext).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Datos Incorrectos, Intenta de nuevo.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 107, 38),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 10),
                      // Botón Registrarse
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterForm(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.person_add_alt_1_outlined,
                          color: Color(0xFFFF9800),
                        ),
                        label: const Text(
                          'Regístrate',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFF9800),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFFFF9800),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
