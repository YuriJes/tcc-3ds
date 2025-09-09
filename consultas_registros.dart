import 'package:flutter/material.dart';
import 'medicacoes_registros.dart';

class ConsultasScreen extends StatefulWidget {
  @override
  _ConsultasScreenState createState() => _ConsultasScreenState();
}

class _ConsultasScreenState extends State<ConsultasScreen> {
  final TextEditingController _especialistaController = TextEditingController();
  final TextEditingController _descricaoConsultaController = TextEditingController();

  @override
  void dispose() {
    _especialistaController.dispose();
    _descricaoConsultaController.dispose();
    super.dispose();
  }

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
        title: LinearProgressIndicator(
          value: 0.66, // Progresso para a segunda tela
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF62A7D2)),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MedicacoesScreen()),
              );
            },
            child: Text('Pular', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Henrique Bueno',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('56 anos', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Consultas:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3B51),
              ),
            ),
            SizedBox(height: 10),
            _buildInputField(
              controller: _especialistaController,
              hintText: 'Especialista',
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descricaoConsultaController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Descrição geral da consulta:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Documentos da consulta:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3B51),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Lógica para adicionar documento
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Adicionar documento clicado!')),
                );
              },
              icon: Icon(Icons.add, color: Colors.blue),
              label: Text('Adicionar', style: TextStyle(color: Colors.blue)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicacoesScreen()),
                  );
                },
                child: Text('Próximo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF62A7D2),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}