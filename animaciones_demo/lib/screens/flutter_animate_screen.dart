import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutterAnimateScreen extends StatelessWidget {
  const FlutterAnimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter_animate')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Animaciones modernas con flutter_animate',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Widget con múltiples animaciones encadenadas
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Icon(Icons.auto_awesome, size: 120, color: Colors.white),
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                .scale(begin: const Offset(0.8, 0.8), duration: 700.ms)
                .then(delay: 200.ms)
                .shimmer(duration: 1200.ms)
                .then(delay: 300.ms)
                .slideY(end: 0, begin: 0.3, duration: 500.ms),

            const SizedBox(height: 60),

            const Text(
              '¡Mira qué fácil es!',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            // Botones para repetir las animaciones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // flutter_animate no necesita setState para repetir
                    // solo reconstruimos el widget
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const FlutterAnimateScreen()),
                    );
                  },
                  icon: const Icon(Icons.replay),
                  label: const Text('Repetir animación'),
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Con flutter_animate puedes agregar fade, scale, slide, shimmer, blur, etc. en una sola línea de código.\n\n¡Mucho más simple que AnimationController!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}