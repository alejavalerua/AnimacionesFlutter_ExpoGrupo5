import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutterAnimateScreen extends StatelessWidget {
  const FlutterAnimateScreen({super.key});

  static const Color _bgColor = Color(0xFFF3EDF7);
  static const Color _cardColor = Color(0xFFFAF7FC);
  static const Color _textPrimary = Color(0xFF2F2140);
  static const Color _textSecondary = Color(0xFF7A6B8F);
  static const Color _borderColor = Color(0xFFE8DFF1);
  static const Color _primary = Color(0xFF6F42C1);
  static const Color _primaryDark = Color(0xFF512DA8);
  static const Color _accent = Color(0xFFE91E63);
  static const Color _accentSoft = Color(0xFFFAD8E8);

  void _restartAnimation(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const FlutterAnimateScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: const Text('Flutter Animate'),
        backgroundColor: _bgColor,
        foregroundColor: _textPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [_primary, _primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: _primary.withOpacity(0.18),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.auto_awesome_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Animaciones modernas con Flutter Animate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Esta librería permite encadenar efectos como fade, scale, shimmer y slide en muy pocas líneas de código.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _cardColor,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: _borderColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: _accent.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bolt_rounded, size: 18, color: _accent),
                          SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Efectos encadenados en una sola animación',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: _accent,
                                fontWeight: FontWeight.w700,
                                fontSize: 13.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: _borderColor),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: _accentSoft,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Text(
                              'Card animada',
                              style: TextStyle(
                                fontSize: 14.5,
                                color: _accent,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                                width: 230,
                                height: 230,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFF8B9D5),
                                      Color(0xFFE91E63),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _accent.withOpacity(0.22),
                                      blurRadius: 20,
                                      offset: const Offset(0, 12),
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome,
                                      size: 82,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      'Flutter Animate',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                              .scale(
                                begin: const Offset(0.82, 0.82),
                                duration: 700.ms,
                                curve: Curves.easeOutBack,
                              )
                              .then(delay: 200.ms)
                              .shimmer(duration: 1200.ms)
                              .then(delay: 300.ms)
                              .slideY(
                                begin: 0.25,
                                end: 0,
                                duration: 500.ms,
                                curve: Curves.easeOut,
                              ),
                          const SizedBox(height: 18),
                          const Text(
                            'Fade + Scale + Shimmer + Slide',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _textSecondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () => _restartAnimation(context),
                      child: Container(
                        width: 210,
                        height: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _primary,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: _primary.withOpacity(0.18),
                              blurRadius: 12,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.replay_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Repetir animación',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Ideal cuando queremos agregar transiciones llamativas de forma rápida y con mucho menos código que una animación manual.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _textSecondary,
                        fontSize: 13.5,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
