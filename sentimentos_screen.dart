import 'package:flutter/material.dart';

class SentimentosScreen extends StatelessWidget {
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
        title: Text('Sentimentos registrados'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildFeelingCard(
              context,
              name: 'Maria da Silva',
              description: 'Registrou o sentimento triste às 10hrs',
              date: '16/07/25',
              icon: Icons.sentiment_very_dissatisfied,
              iconColor: Colors.red,
            ),
          
          ],
        ),
      ),
    );
  }

  Widget _buildFeelingCard(BuildContext context, {
    required String name,
    required String description,
    required String date,
    required IconData icon,
    required Color iconColor,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(icon, color: iconColor, size: 40),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(description, style: TextStyle(color: Colors.grey)),
                  Text(date, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}