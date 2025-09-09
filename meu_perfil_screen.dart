import 'package:flutter/material.dart';
import 'perfil_screen.dart';
import 'configuracoes_screen.dart';
import 'politica_privacidade_screen.dart';
import 'historico_registros_screen.dart';
import 'login_screen.dart';

class MeuPerfilScreen extends StatelessWidget {
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
        title: Text('Meu Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/carolina.png'),
            ),
            SizedBox(height: 10),
            Text('Carolina Martins', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            _buildProfileItem(
              context,
              icon: Icons.person_outline,
              label: 'Perfil',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilScreen()),
                );
              },
            ),
            _buildProfileItem(
              context,
              icon: Icons.lock_outline,
              label: 'Política de Privacidade',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoliticaPrivacidadeScreen()),
                );
              },
            ),
            _buildProfileItem(
              context,
              icon: Icons.settings_outlined,
              label: 'Configurações',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfiguracoesScreen()),
                );
              },
            ),
            _buildProfileItem(
              context,
              icon: Icons.logout,
              label: 'Sair',
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
            _buildProfileItem(
              context,
              icon: Icons.assignment_outlined,
              label: 'Histórico De Registros',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoricoRegistrosScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sair'),
          content: Text('você realmente quer sair?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Sim, Sair'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProfileItem(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue.shade700),
            SizedBox(width: 20),
            Expanded(
              child: Text(label, style: TextStyle(fontSize: 16)),
            ),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
