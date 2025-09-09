import 'package:flutter/material.dart';
import 'sinais_clinicos_screen.dart';

class SentimentosPacienteScreen extends StatefulWidget {
  @override
  _SentimentosPacienteScreenState createState() => _SentimentosPacienteScreenState();
}

class _SentimentosPacienteScreenState extends State<SentimentosPacienteScreen> {
  String? _selectedSentiment;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Dados do paciente para passar para a próxima tela
    Map<String, dynamic> patientData = {
      'nomePaciente': 'Henrique Bueno',
      'idadePaciente': '56 anos',
      'sentimentoSelecionado': _selectedSentiment ?? 'Nenhum selecionado',
      'notasBusca': _searchController.text,
    };

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
        title: Text('Registro de Sentimentos', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SinaisClinicosScreen(),
                ),
              );
            },
            child: Text('Próximo', style: TextStyle(color: Colors.blue)),
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
                    patientData['nomePaciente'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(patientData['idadePaciente'], style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Estado geral desse paciente hoje:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar sentimentos...',
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
            Row(
              children: [
                _buildSentimentButton('Muito mal', Color(0xFFE57373)),
                SizedBox(width: 10),
                _buildSentimentButton('Muito bem', Color(0xFF81C784)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildSentimentButton('Mal', Color(0xFFFFB74D)),
                SizedBox(width: 10),
                _buildSentimentButton('Bem', Color(0xFF4FC3F7)),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SinaisClinicosScreen(),
                    ),
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

  Widget _buildSentimentButton(String text, Color color) {
    bool isSelected = _selectedSentiment == text;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSentiment = text;
          });
        },
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16.0),
            border: isSelected
                ? Border.all(color: Colors.black, width: 3.0)
                : Border.all(color: Colors.transparent, width: 0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
