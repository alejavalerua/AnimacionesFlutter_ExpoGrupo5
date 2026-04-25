import 'package:flutter/material.dart';
import 'hero_detail_screen.dart';

class HeroListScreen extends StatelessWidget {
  const HeroListScreen({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'id': 'earth',
      'title': 'Tierra',
      'icon': Icons.public,
      'color': Colors.blue,
      'subtitle': 'Nuestro planeta'
    },
    {
      'id': 'moon',
      'title': 'Luna',
      'icon': Icons.nightlight_round,
      'color': Colors.grey,
      'subtitle': 'Satélite natural'
    },
    {
      'id': 'mars',
      'title': 'Marte',
      'icon': Icons.rocket_launch,
      'color': Colors.red,
      'subtitle': 'El planeta rojo'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Hero(
                tag: item['id'],
                child: CircleAvatar(
                  backgroundColor: item['color'],
                  child: Icon(item['icon'], color: Colors.white),
                ),
              ),
              title: Text(item['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(item['subtitle']),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HeroDetailScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}