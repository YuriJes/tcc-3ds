import 'package:flutter/material.dart';
import 'notificacoes_screen.dart'; // Importa a tela de Notificações

class ConfiguracoesScreen extends StatelessWidget {
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
        title: Text('Configurações'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildSettingsItem(
              context,
              icon: Icons.notifications_outlined,
              label: 'Notificações',
              onTap: () {
                // Navegação para a tela de Notificações
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificacoesScreen()),
                );
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.vpn_key_outlined,
              label: 'Senhas',
              onTap: () {},
            ),
            _buildSettingsItem(
              context,
              icon: Icons.delete_outline,
              label: 'Deletar Conta',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
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