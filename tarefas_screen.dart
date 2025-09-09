import 'package:flutter/material.dart';

class TarefasScreen extends StatelessWidget {
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
        title: Text('Tarefas'),
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
                  _buildTaskCard(
                    context,
                    name: 'Henrique bueno',
                    task: 'Fazer 20 minutos de ginástica',
                    imagePath: 'assets/pessoa1.jpg', // Substitua pelo caminho da sua imagem
                  ),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context, {
    required String name,
    required String task,
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
                  Text(task, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
