import 'package:flutter/material.dart';
import 'package:semtepo/sinais_clinicos_screen.dart';
import 'confirmacao_registro.dart';

class MedicacoesScreen extends StatefulWidget {
  @override
  _MedicacoesScreenState createState() => _MedicacoesScreenState();
}

class _MedicacoesScreenState extends State<MedicacoesScreen> {
  List<Map<String, TextEditingController>> _medicamentos = [];

  @override
  void initState() {
    super.initState();
    _addMedicamentoField(); // Adiciona o primeiro campo de medicamento por padrão
  }

  void _addMedicamentoField() {
    setState(() {
      _medicamentos.add({
        'medicamento': TextEditingController(),
        'dosagem': TextEditingController(),
        'hora': TextEditingController(),
      });
    });
  }

  @override
  void dispose() {
    for (var med in _medicamentos) {
      med['medicamento']?.dispose();
      med['dosagem']?.dispose();
      med['hora']?.dispose();
    }
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
          value: 1.0, // Progresso para a última tela
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF62A7D2)),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SinaisClinicosScreen()),
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
              'Medicações:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3B51),
              ),
            ),
            SizedBox(height: 10),
            ..._medicamentos.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, TextEditingController> med = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medicamento ${index + 1}:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    _buildInputField(
                      controller: med['medicamento']!,
                      hintText: 'Medicamentos',
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildInputField(
                            controller: med['dosagem']!,
                            hintText: 'Dosagem',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildInputField(
                            controller: med['hora']!,
                            hintText: 'Hora',
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            Center(
              child: IconButton(
                onPressed: _addMedicamentoField,
                icon: Icon(Icons.add_circle, color: Color(0xFF62A7D2), size: 40),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SinaisClinicosScreen()),
                  );
                },
                child: Text('Enviar'),
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