import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool _isExpanded = false;

  static const Color _bgColor = Color(0xFFF3EDF7);
  static const Color _cardColor = Color(0xFFFAF7FC);
  static const Color _textPrimary = Color(0xFF2F2140);
  static const Color _textSecondary = Color(0xFF7A6B8F);
  static const Color _borderColor = Color(0xFFE8DFF1);
  static const Color _primary = Color(0xFF6F42C1);
  static const Color _primaryDark = Color(0xFF512DA8);
  static const Color _accent = Color(0xFF9C27B0);

  void _toggleCard() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
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
                      Icons.animation_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Animación implícita',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Este demo muestra cómo AnimatedContainer anima automáticamente cambios de tamaño, color, bordes y padding.',
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
                            Icons.touch_app_rounded,
                            size: 18,
                            color: _accent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Toca el botón para cambiar el estado',
                            style: TextStyle(
                              color: _accent,
                              fontWeight: FontWeight.w700,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOutCubic,
                      width: _isExpanded ? 250 : 130,
                      height: _isExpanded ? 220 : 130,
                      padding: EdgeInsets.all(_isExpanded ? 22 : 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: _isExpanded
                              ? [
                                  const Color(0xFFE7C8EC),
                                  const Color(0xFFB86DC3),
                                ]
                              : [
                                  const Color(0xFF9C27B0),
                                  const Color(0xFF6F42C1),
                                ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(
                          _isExpanded ? 36 : 24,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                (_isExpanded
                                        ? const Color(0xFFB86DC3)
                                        : _primary)
                                    .withOpacity(0.25),
                            blurRadius: _isExpanded ? 24 : 16,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isExpanded
                                ? Icons.auto_awesome_rounded
                                : Icons.touch_app_rounded,
                            size: _isExpanded ? 42 : 30,
                            color: _isExpanded
                                ? const Color(0xFF4B1E57)
                                : Colors.white,
                          ),
                          SizedBox(height: _isExpanded ? 14 : 10),
                          Text(
                            _isExpanded ? 'Estado activo' : '¡Toca!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _isExpanded
                                  ? const Color(0xFF4B1E57)
                                  : Colors.white,
                              fontSize: _isExpanded ? 20 : 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          if (_isExpanded) ...[
                            const SizedBox(height: 10),
                            const Text(
                              'Cambian tamaño,\ncolor, bordes y padding.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF5F3668),
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                                height: 1.35,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    GestureDetector(
                      onTap: _toggleCard,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 280),
                        curve: Curves.easeInOut,
                        width: _isExpanded ? 210 : 180,
                        height: _isExpanded ? 56 : 50,
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
                        child: Text(
                          _isExpanded ? 'Volver al estado base' : 'Expandir',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
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
