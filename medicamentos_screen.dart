import 'package:flutter/material.dart';

class MedicamentosScreen extends StatelessWidget {
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
        title: Text('Medicamentos'),
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
                  _buildMedicationCard(
                    context,
                    name: 'Henrique bueno',
                    details: 'Medicamento: Prednisona\nDosagem: 2 comprimidos\nHorários: 9hrs e 18hrs',
                    imagePath: 'assets/pessoa1.jpg', // Substitua pelo caminho da sua imagem
                  ),
                  _buildMedicationCard(
                    context,
                    name: 'Maria da Silva',
                    details: 'Medicamento: Loratadina\nDosagem: 1 comprimido\nHorários: 8hrs',
                    imagePath: 'assets/pessoa2.jpg', // Substitua pelo caminho da sua imagem
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationCard(BuildContext context, {
    required String name,
    required String details,
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
                  Text(details, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}