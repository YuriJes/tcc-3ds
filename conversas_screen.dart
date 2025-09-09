import 'package:flutter/material.dart';
import 'chat_screen.dart';


class ConversasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 8),
            Icon(Icons.search, color: Colors.blue),
            SizedBox(width: 8),
            Text('Buscar Conversas', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab(Icons.message_outlined, 'conversas', true),
                  _buildTab(Icons.call_outlined, 'chamadas', false),
                  _buildTab(Icons.person_outline, 'contatos', false),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildChatTile(
              context,
              name: 'Henrique Bueno',
              message: 'Como você está se sentindo hoje?',
              imagePath: 'assets/pessoa1.jpg',
              unreadCount: 4,
            ),
            _buildChatTile(
              context,
              name: 'Familiares',
              message: '2 min ago',
              imagePath: 'assets/familiares.png',
              unreadCount: 4,
            ),
            _buildChatTile(
              context,
              name: 'Familiar',
              message: 'Oi mãe como a senhora está?',
              imagePath: 'assets/familiar.png',
              unreadCount: 0,
            ),
            _buildChatTile(
              context,
              name: 'Paciente: Caio Divo',
              message: 'Como você está se sentindo hoje?',
              imagePath: 'assets/caio_divo.png',
              unreadCount: 0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(IconData icon, String title, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatTile(BuildContext context, {
    required String name,
    required String message,
    required String imagePath,
    required int unreadCount,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              chatName: name,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 28,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(message, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            if (unreadCount > 0)
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Text(
                  unreadCount.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
