import 'package:flutter/material.dart';
import 'sentimentos_paciente_screen.dart'; // Importa a tela de sentimentos

class SelecionarPacienteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Tela Sintomas', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pra qual paciente é esse relatório?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3B51),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar pacientes',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            _buildPatientCard(
              context,
              'Henrique Bueno',
              '56 anos',
              'https://randomuser.me/api/portraits/men/32.jpg',
            ),
            _buildPatientCard(
              context,
              'Pedro Bossa',
              '89 anos',
              'https://randomuser.me/api/portraits/men/33.jpg',
            ),
            _buildPatientCard(
              context,
              'Caio Diva',
              '47 anos',
              'https://randomuser.me/api/portraits/men/34.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCard(BuildContext context, String name, String age, String imageUrl) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(age, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navega para a tela de sentimentos do paciente
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SentimentosPacienteScreen()),
                );
              },
              child: Text('Selecionar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF62A7D2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
