import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
            title: const Text(
              'Formulario de Registro',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors
                .transparent, // Hacemos el fondo transparente para que el degradado se vea
            elevation: 0, // Eliminamos la sombra para un look más limpio
            centerTitle: true,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100], // Fondo gris claro
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Datos de Usuario
            const SectionHeader(title: 'DATOS DE USUARIO'),
            const SizedBox(height: 16),
            const CustomTextFormField(
                label: 'Nombre Completo *', icon: Icons.person),
            const CustomTextFormField(
                label: 'Correo Electrónico *', icon: Icons.email),
            const CustomTextFormField(
                label: 'Número Celular *',
                keyboardType: TextInputType.phone,
                icon: Icons.phone),
            const CustomTextFormField(
                label: 'Contraseña *', obscureText: true, icon: Icons.lock),
            const SizedBox(height: 24),

            // Datos de la Empresa
            const SectionHeader(title: 'DATOS DE SU EMPRESA'),
            const SizedBox(height: 16),
            const CustomTextFormField(
                label: 'Razón Social *', icon: Icons.business),
            const CustomTextFormField(label: 'R.F.C *', icon: Icons.article),
            const CustomTextFormField(
                label: 'Domicilio Fiscal *', icon: Icons.location_on),
            const CustomTextFormField(
                label: 'Email para pedidos *', icon: Icons.email_outlined),
            const CustomTextFormField(
                label: 'Domicilio Planta / Oficinas', icon: Icons.map),
            const SizedBox(height: 16),

            const Text(
              'Teléfonos:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Row(
              children: [
                Flexible(
                  child: CustomTextFormField(
                      label: 'Tel #1',
                      keyboardType: TextInputType.phone,
                      icon: Icons.phone_android),
                ),
                SizedBox(width: 16),
                Flexible(
                  child: CustomTextFormField(
                      label: 'Tel #2',
                      keyboardType: TextInputType.phone,
                      icon: Icons.phone_android),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Datos Bancarios Pesos
            const SectionHeader(title: 'DATOS BANCARIOS PESOS MEXICANOS'),
            const SizedBox(height: 16),
            const CustomTextFormField(
                label: 'Nombre del Banco', icon: Icons.account_balance),
            const CustomTextFormField(
                label: 'Número de Cuenta',
                keyboardType: TextInputType.number,
                icon: Icons.account_box),
            const CustomTextFormField(
                label: 'Clave Interbancaria',
                keyboardType: TextInputType.number,
                icon: Icons.vpn_key),
            const SizedBox(height: 24),

            // Datos Bancarios Dólares
            const SectionHeader(title: 'DATOS BANCARIOS DOLARES (Opcional)'),
            const SizedBox(height: 16),
            const CustomTextFormField(
                label: 'Nombre del Banco', icon: Icons.account_balance),
            const CustomTextFormField(
                label: 'Número de Cuenta',
                keyboardType: TextInputType.number,
                icon: Icons.account_box),
            const CustomTextFormField(
                label: 'Clave Interbancaria',
                keyboardType: TextInputType.number,
                icon: Icons.vpn_key),
            const SizedBox(height: 32),

            // Botón de Registro
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Manejar el envío del formulario
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green[700], // Mantén el color del botón
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Registrarme',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? icon;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: Colors.black) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.white, // Fondo blanco para el campo
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.black), // Color del borde al enfocar
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.blueGrey), // Color del borde habilitado
            borderRadius: BorderRadius.circular(12.0),
          ),
          labelStyle: const TextStyle(
              color: Colors.black), // Color del texto de la etiqueta
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: Colors.black, // Color del cursor
        style: const TextStyle(
            color: Colors.black), // Color del texto dentro del campo
      ),
    );
  }
}
