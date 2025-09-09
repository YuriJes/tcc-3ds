
import 'package:flutter/material.dart';
import 'perfil_screen.dart';
import 'adicionar_paciente_screen.dart';

class PacientesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacientes'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => newMethod()),
              );
            },
            child: Text('Adicionar', style: TextStyle(color: Colors.lightBlue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildPatientCard(
              context,
              name: 'Yuri Jorge',
              age: '18 anos',
              imagePath: 'assets/yuri.png',
            ),
            _buildPatientCard(
              context,
              name: 'Henrique Bueno',
              age: '56 anos',
              imagePath: 'assets/henrique.png',
            ),
            _buildPatientCard(
              context,
              name: 'Henrique Bueno',
              age: '56 anos',
              imagePath: 'assets/henrique.png',
            ),
          ],
        ),
      ),
    );
  }

  AdicionarPacienteScreen newMethod() => AdicionarPacienteScreen();

  Widget _buildPatientCard(BuildContext context, {
    required String name,
    required String age,
    required String imagePath,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(age, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(width: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilScreen()),
                );
              },
              child: Text('Detalhes'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Excluir'),
            ),
          ],
        ),
      ),
    );
  }
}
