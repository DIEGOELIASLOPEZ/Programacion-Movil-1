import 'package:flutter/material.dart';

class DenunciasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulación de denuncias (esto sería reemplazado por datos reales en un futuro)
    List<Map<String, String>> denuncias = [
      {
        'id': '1',
        'descripcion': 'Robo',
        'fecha': '2025-04-10',
        'estado': 'En revisión',
        'razon': 'Robo de objetos personales',
        'direccion': 'Calle Ficticia #123',
        'hora': '14:30',
        'foto': '', // Aquí agregaríamos la URL de la foto o la imagen si la hubiera
      },
      {
        'id': '2',
        'descripcion': 'Accidente vehicular',
        'fecha': '2025-04-12',
        'estado': 'Pendiente',
        'razon': 'Accidente en intersección',
        'direccion': 'Av. Principal #456',
        'hora': '09:15',
        'foto': '', // Aquí agregaríamos la URL de la foto o la imagen si la hubiera
      },
      {
        'id': '3',
        'descripcion': 'Poste Caído',
        'fecha': '2025-04-14',
        'estado': 'Revisada',
        'razon': 'Poste dañado por accidente',
        'direccion': 'Calle Ficticia #789',
        'hora': '17:00',
        'foto': '', // Aquí agregaríamos la URL de la foto o la imagen si la hubiera
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Denuncias'),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Botón para volver atrás
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Aquí puedes ver las denuncias que has realizado.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            // Lista de denuncias
            Expanded(
              child: ListView.builder(
                itemCount: denuncias.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(denuncias[index]['descripcion']!),
                      subtitle: Text('Fecha: ${denuncias[index]['fecha']}'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'editar') {
                            // Acción para editar la denuncia
                          } else if (value == 'eliminar') {
                            // Acción para eliminar la denuncia
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              value: 'editar',
                              child: Text('Editar'),
                            ),
                            PopupMenuItem<String>(
                              value: 'eliminar',
                              child: Text('Eliminar'),
                            ),
                          ];
                        },
                      ),
                      onTap: () {
                        // Acción para mostrar los detalles de la denuncia
                        _mostrarDetallesDenuncia(context, denuncias[index]);
                      },
                    ),
                  );
                },
              ),
            ),
            // Botón para agregar una nueva denuncia
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Acción para agregar una nueva denuncia
                },
                child: Text('Agregar Denuncia'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para mostrar el detalle de la denuncia en un popup
  void _mostrarDetallesDenuncia(BuildContext context, Map<String, String> denuncia) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles de la Denuncia'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Estado
                Row(
                  children: [
                    Text('Estado: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(denuncia['estado']!),
                  ],
                ),
                SizedBox(height: 8),

                // Razón
                Row(
                  children: [
                    Text('Razón: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(denuncia['razon']!),
                  ],
                ),
                SizedBox(height: 8),

                // Dirección
                Row(
                  children: [
                    Text('Dirección: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(denuncia['direccion']!),
                  ],
                ),
                SizedBox(height: 8),

                // Fecha y Hora
                Row(
                  children: [
                    Text('Fecha y Hora: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${denuncia['fecha']} - ${denuncia['hora']}'),
                  ],
                ),
                SizedBox(height: 8),

                // Fotografía/Video
                Row(
                  children: [
                    Text("Fotografía/Video: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    denuncia['foto']!.isNotEmpty
                        ? Image.network(denuncia['foto']!) // Mostrar la foto si la hay
                        : SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );

      },
    );
  }
}
