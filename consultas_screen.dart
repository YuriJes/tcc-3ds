import 'package:flutter/material.dart';

class ConsultasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Consultas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar pacientes',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildPatientCard(
                    context,
                    name: 'Henrique Bueno',
                    address: 'Rua malmiquer 345',
                    specialty: 'Cardiologista',
                    time: '7 am',
                    imagePath: 'assets/pessoa1.jpg', // Lembre de adicionar a imagem
                  ),
                  _buildPatientCard(
                    context,
                    name: 'Maria da Silva',
                    address: 'Rua costelo 384',
                    specialty: 'Cardiologista',
                    time: '9 am',
                    imagePath: 'assets/pessoa2.jpg', // Lembre de adicionar a imagem
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCard(BuildContext context, {
    required String name,
    required String address,
    required String specialty,
    required String time,
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
                  Text(address, style: TextStyle(color: Colors.grey)),
                  Text(specialty, style: TextStyle(color: Colors.grey)),
                  Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}