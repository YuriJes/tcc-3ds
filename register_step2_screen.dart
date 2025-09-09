import 'package:flutter/material.dart';
import 'register_step3_screen.dart'; // Corrija o caminho, se necessário

class RegisterStep2Screen extends StatefulWidget {
  @override
  _RegisterStep2ScreenState createState() => _RegisterStep2ScreenState();
}

class _RegisterStep2ScreenState extends State<RegisterStep2Screen> {
  String? _selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text('Cadastrar-Se'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.person, size: 60, color: Colors.blue.shade700),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Deseja cadastrar como:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            _buildUserTypeOption('Cuidador', 'cuidador'),
            _buildUserTypeOption('Paciente', 'paciente'),
            _buildUserTypeOption('Familiar', 'familiar'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterStep3Screen()),
                );
              },
              child: Text('Próximo'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTypeOption(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: RadioListTile<String>(
          title: Text(title),
          value: value,
          groupValue: _selectedUserType,
          onChanged: (String? newValue) {
            setState(() {
              _selectedUserType = newValue;
            });
          },
        ),
      ),
    );
  }
}