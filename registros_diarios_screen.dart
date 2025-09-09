import 'package:flutter/material.dart';
import 'selecionar_paciente_screen.dart';

class RegistrosDiariosScreen extends StatefulWidget {
  @override
  _RegistrosDiariosScreenState createState() => _RegistrosDiariosScreenState();
}

class _RegistrosDiariosScreenState extends State<RegistrosDiariosScreen> {
  // Estado para gerenciar os checkboxes
  final List<String> _selectedActivities = [];
  final TextEditingController _otherController = TextEditingController();
  final TextEditingController _observationsController = TextEditingController();

  @override
  void dispose() {
    _otherController.dispose();
    _observationsController.dispose();
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
        title: Text('Tela Registros Diários', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelecionarPacienteScreen()),
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
            _buildCheckboxRow(['Banho', 'Exercícios']),
            _buildCheckboxRow(['Alimentação', 'Medicação']),
            _buildCheckboxRow(['Conversas', 'Outros']),
            SizedBox(height: 20),
            Text(
              'Outros...',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _otherController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Descreva...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Observações gerais',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _observationsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Descreva o que aconteceu no dia, alterações, dificuldades ou pontos de atenção',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navega para a próxima tela
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelecionarPacienteScreen()),
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

  Widget _buildCheckboxRow(List<String> titles) {
    return Row(
      children: titles
          .map((title) => Expanded(
                child: CheckboxListTile(
                  title: Text(title),
                  value: _selectedActivities.contains(title),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedActivities.add(title);
                      } else {
                        _selectedActivities.remove(title);
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ))
          .toList(),
    );
  }
}
