import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [
      "Peluncuran roket SpaceX Falcon 9 dijadwalkan besok.",
      "NASA merilis gambar terbaru dari Teleskop James Webb.",
      "Artikel 'Mars Rover Update' telah ditambahkan ke sistem.",
      "Selamat datang di aplikasi SpaceNews Core!"
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications_active, color: Colors.indigo),
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}