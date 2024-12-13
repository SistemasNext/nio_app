// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nio_app/clientes_screen.dart';
import 'package:nio_app/login_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 131, 0, 1),
                Color.fromRGBO(253, 210, 29, 1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/img/Logo-NIO.png',
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/img/sistemas_perfil.jpeg'),
                ),
              ],
            ),
            backgroundColor: Colors
                .transparent, // Hacemos el fondo transparente para que el degradado se vea
            elevation: 0, // Eliminamos la sombra para un look más limpio
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/img/sistemas_perfil.jpeg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Jorge Barrera Ramos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Control'),
              children: [
                ListTile(
                  title: const Text('Control de Clientes'),
                  onTap: () {
                    Navigator.push(
                      context,
                      // ignore: prefer_const_constructors
                      MaterialPageRoute(builder: (context) => ClientesScreen()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Control de Exhibidores'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Control de Requisiciones'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Control de Materiales'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Órdenes de Trabajo'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Cuentas por Pagar'),
                  onTap: () {},
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text('Materiales'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.storage),
              title: const Text('Existencia en Inventario'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Reportes'),
              onTap: () {},
            ),
            ExpansionTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Órdenes'),
              children: [
                ListTile(
                  title: const Text('Órdenes de Compra'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Órdenes de Trabajo'),
                  onTap: () {},
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar Sesión'),
              onTap: () async {
                // Mostrar el diálogo de cerrando sesión
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const Dialog(
                      backgroundColor: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Cerrando Sesión',
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

                // Simulación del proceso de cerrar sesión
                await Future.delayed(const Duration(seconds: 2));

                Navigator.of(context).pop(); // Cerrar el diálogo de carga
                // Aquí agregas la lógica para cerrar la sesión, por ejemplo, limpiar datos de usuario, tokens, etc.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenid@!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Jorge Barrera Ramos',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
