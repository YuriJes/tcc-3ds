import 'package:flutter/material.dart';
import 'relatorios_screen.dart';

class PerfilScreen extends StatelessWidget {
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
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/carolina.png'),
                  radius: 50,
                ),
              ),
              SizedBox(height: 16),
              _buildInfoSection('Nome Completo', 'Carolina Martins'),
              _buildInfoSection('Número', '+666 999 999999'),
              _buildInfoSection('Data de Nascimento', '30 / 05 / 2007'),
              _buildInfoSection('Endereço', 'rua dos saburus'),
              _buildInfoSection('Informações Físicas', '...'),
              _buildInfoSection('Comorbidades', '...'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RelatoriosScreen()),
                  );
                },
                child: Text('Acessar Relatórios'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Adicionar Familiar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(value),
        Divider(),
        SizedBox(height: 10),
      ],
    );
  }
}