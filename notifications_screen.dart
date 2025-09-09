import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFBBDEFB),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildNotificationCard(
                context,
                '27 FEB',
                'Consulta medica Cardiologista',
                'R.Malmequer 534, Jardim Real',
                'Faltam 3 dias!',
              ),
              const SizedBox(height: 16),
              _buildNotificationCard(
                context,
                '28 FEB',
                'Medicação programada',
                '2 capsulas',
                'NEW',
              ),
              const SizedBox(height: 16),
              _buildNotificationCard(
                context,
                '01 MAR',
                'Medicação programada',
                '1 capsula',
                'NEW',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
      BuildContext context, String date, String title, String subtitle, String status) {
    return InkWell(
      onTap: () {
        // Navigate to the details screen. You would import and use it here.
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen()));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFE1F5FE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date.split(' ')[0],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      date.split(' ')[1],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(subtitle),
                    const SizedBox(height: 4),
                    if (status == 'NEW')
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'NEW',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      )
                    else
                      Text(
                        status,
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
      ),
    );
  }
}