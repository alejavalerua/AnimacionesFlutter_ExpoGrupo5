import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedOpacity + AnimatedSwitcher')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Presiona el botón para ocultar/mostrar',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // AnimatedOpacity
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Icon(Icons.favorite, size: 80, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // AnimatedSwitcher (para cambiar entre iconos)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _isVisible
                  ? const Icon(Icons.sunny, size: 80, color: Colors.amber, key: ValueKey(1))
                  : const Icon(Icons.nightlight_round, size: 80, color: Colors.indigo, key: ValueKey(2)),
            ),

            const SizedBox(height: 50),

            ElevatedButton.icon(
              onPressed: () {
                setState(() => _isVisible = !_isVisible);
              },
              icon: Icon(_isVisible ? Icons.visibility_off : Icons.visibility),
              label: Text(_isVisible ? 'Ocultar' : 'Mostrar'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}