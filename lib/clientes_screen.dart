import 'package:flutter/material.dart';

class ClientesScreen extends StatelessWidget {
  const ClientesScreen({super.key});

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
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título de la sección
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Lista de Clientes y Marcas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// TABLA DE CLIENTES
              /// TABLA 1
              /// PRIMERA TABLA - CLIENTES
              _buildCardTable(
                title: 'Clientes',
                buttonLabel: 'Agregar',
                columns: const ['ID', 'Nombre', 'RFC', 'Acciones'],
                rows: List.generate(
                  5,
                  (index) => [
                    '$index',
                    'Cliente $index',
                    'RFC-$index',
                    PopupMenuButton<String>(
                      surfaceTintColor: Colors.white,
                      onSelected: (value) {
                        if (value == 'addMarca') {
                          /// print('Agregar Marca Para Cliente: $index');
                        } else if (value == 'designMarca') {
                          /// print('Designar Marca para Cliente $index');
                        } else if (value == 'editCliente') {
                          /// print('Editar Cliente $index');
                        }
                      },
                      icon: const Center(
                        child: Icon(Icons.more_vert, color: Colors.black),
                      ),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'addMarca',
                          child: ListTile(
                            leading: Icon(Icons.add, color: Colors.green),
                            title: Text('Agregar Marca'),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'designMarca',
                          child: ListTile(
                            leading:
                                Icon(Icons.assignment, color: Colors.orange),
                            title: Text('Designar Marca'),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'editCliente',
                          child: ListTile(
                            leading: Icon(Icons.edit, color: Colors.blue),
                            title: Text('Editar Cliente'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onAddPressed: () {
                  _showAddClientForm(context);
                },
              ),
              const SizedBox(height: 20),

              /// TABLA 2
              /// SEGUNDA TABLA - MARCAS
              _buildCardTable(
                title: 'Marcas',
                buttonLabel: 'Agregar',
                columns: const ['ID', 'Nombre', 'Acciones'],
                rows: List.generate(
                  8,
                  (index) => [
                    '$index',
                    'Marca $index',
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          /// print('Editar Marca');
                        },
                      ),
                    ),
                  ],
                ),
                onAddPressed: () {
                  _showAddMarksForm(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// FUNCION PARA CONSTRUIR UNA TERJATA CON UNA TABLA
  Widget _buildCardTable({
    required String title,
    required String buttonLabel,
    required List<String> columns,
    required List<List<dynamic>> rows,
    required VoidCallback onAddPressed,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Borde de la tarjeta
      ),
      child: Column(
        children: [
          // Encabezado de la tarjeta
          Container(
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: onAddPressed,
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: Text(
                    buttonLabel,
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: 1.5),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(Colors.orange),
                columnSpacing: 30,
                columns: columns
                    .map(
                      (column) => DataColumn(
                        label: Text(
                          column,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    )
                    .toList(),
                rows: rows
                    .map(
                      (row) => DataRow(
                        cells: row
                            .map(
                              (cell) => DataCell(
                                cell is Widget
                                    ? cell
                                    : Text(
                                        cell.toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// MENSAJE DE FORMULARIO PARA CLIENTES
  void _showAddClientForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Colors.white, // Fondo blanco
          child: Container(
            width: 600,
            // Ancho fijo más profesional
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'Formulario de Creación de Clientes',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// SECCIÓN "DATOS DEL CLIENTE"
                  const Text(
                    'Datos del Cliente',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// CAMPOS DEL FORMULARIO
                  _buildTextField('Razón Social', 'Ingresa la razón social'),
                  _buildTextField(
                      'Domicilio Fiscal', 'Ingresa el domicilio fiscal'),
                  _buildTextField('R.F.C', 'Ingresa su R.F.C'),
                  _buildTextField('Nombre de Contacto', 'Nombre del contacto'),
                  _buildTextField('Teléfono de Contacto #1', 'Tel #1'),
                  _buildTextField('Teléfono de Contacto #2', 'Tel #2'),
                  _buildTextField('Email', 'Ingresa su email'),
                  _buildTextField(
                      'Domicilio de Entrega', 'Ingresa su domicilio'),
                  const SizedBox(height: 20),
                  // Botones
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar'),
                      ),
                      const SizedBox(width: 12),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                        ),
                        onPressed: () {
                          // Acción de guardar
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// MENSAJE DE FORMULARIO PARA MARCAS
  void _showAddMarksForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Colors.white, // Fondo blanco
          child: Container(
            width: 600, // Ancho fijo más profesional
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'Formulario de Creación de Marca',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Sección "DATOS DE LA MARCA"
                  const Text(
                    'Datos de la Marca',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildTextField(
                      'Nombre de la Marca', 'Ingresa el nombre de la marca'),
                  // Botones
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar'),
                      ),
                      const SizedBox(width: 14),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                        ),
                        onPressed: () {
                          // Acción de guardar
                        },
                        child: const Text('Guardar'),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// WIDGET PARA CADA CAMPO DE TEXTO
  Widget _buildTextField(String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey), //TEXTO DE SUGERENCIA
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black) //BORDE CUANDO ESTA HABILITADO
              ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black), //BORDE CUANDO ESTA ENFOCADO
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: label,
          labelStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
