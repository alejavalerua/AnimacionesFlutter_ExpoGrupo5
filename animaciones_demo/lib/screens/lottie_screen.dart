import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> {
  bool isPlaying = true;

  static const Color _bgColor = Color(0xFFF3EDF7);
  static const Color _cardColor = Color(0xFFFAF7FC);
  static const Color _textPrimary = Color(0xFF2F2140);
  static const Color _textSecondary = Color(0xFF7A6B8F);
  static const Color _borderColor = Color(0xFFE8DFF1);
  static const Color _primary = Color(0xFF6F42C1);
  static const Color _primaryDark = Color(0xFF512DA8);
  static const Color _accent = Color(0xFF43A047);
  static const Color _accentSoft = Color(0xFFE4F3E6);

  void _togglePlayback() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: const Text('Lottie'),
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
                      Icons.movie_creation_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Animación profesional con Lottie',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Lottie permite mostrar animaciones complejas en formato JSON sin construirlas manualmente en el código.',
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
                          Icon(
                            Icons.auto_awesome_rounded,
                            size: 18,
                            color: _accent,
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Demostración de animación externa',
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
                    const SizedBox(height: 22),
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
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 280,
                            height: 280,
                            child: Lottie.asset(
                              'assets/lottie/rocket.json',
                              repeat: true,
                              animate: isPlaying,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: _togglePlayback,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 280),
                        curve: Curves.easeInOut,
                        width: isPlaying ? 190 : 210,
                        height: isPlaying ? 50 : 56,
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isPlaying ? 'Pausar' : 'Reproducir',
                              style: const TextStyle(
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
                      'Ideal para pantallas de carga, mensajes de éxito\ny estados vacíos con un acabado más profesional.',
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
