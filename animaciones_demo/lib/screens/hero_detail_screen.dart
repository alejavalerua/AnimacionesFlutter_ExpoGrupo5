import 'package:flutter/material.dart';

class HeroDetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const HeroDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de ${item['title']}'),
        backgroundColor: item['color'],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: item['id'],
              child: CircleAvatar(
                radius: 80,
                backgroundColor: item['color'],
                child: Icon(item['icon'], size: 100, color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              item['title'],
              style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              item['subtitle'],
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}