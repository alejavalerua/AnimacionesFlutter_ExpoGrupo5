import 'package:flutter/material.dart';
import 'animated_container_screen.dart';
import 'animated_opacity_screen.dart';
import 'hero_list_screen.dart';
import 'explicit_animation_screen.dart';
import 'lottie_screen.dart';
import 'flutter_animate_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones en Flutter'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Créditos - Nombres
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, color: Colors.deepPurple, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Elvira Florez  &  Alejandra Valencia',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Grid de demos
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDemoCard(context, 'AnimatedContainer', Icons.animation, Colors.purple, const AnimatedContainerScreen()),
                  _buildDemoCard(context, 'AnimatedOpacity', Icons.opacity, Colors.blue, const AnimatedOpacityScreen()),
                  _buildDemoCard(context, 'Hero Animation', Icons.compare_arrows, Colors.orange, const HeroListScreen()),
                  _buildDemoCard(context, 'AnimationController', Icons.control_camera, Colors.red, const ExplicitAnimationScreen()),
                  _buildDemoCard(context, 'Lottie', Icons.movie_creation, Colors.green, const LottieScreen()),
                  _buildDemoCard(context, 'FlutterAnimate', Icons.auto_awesome, Colors.pink, const FlutterAnimateScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoCard(BuildContext context, String title, IconData icon, Color color, Widget screen) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}