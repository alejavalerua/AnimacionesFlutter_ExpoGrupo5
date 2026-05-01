import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  bool _isVisible = true;

  static const Color _bgColor = Color(0xFFF3EDF7);
  static const Color _cardColor = Color(0xFFFAF7FC);
  static const Color _textPrimary = Color(0xFF2F2140);
  static const Color _textSecondary = Color(0xFF7A6B8F);
  static const Color _borderColor = Color(0xFFE8DFF1);
  static const Color _primary = Color(0xFF6F42C1);
  static const Color _primaryDark = Color(0xFF512DA8);
  static const Color _accent = Color(0xFF1E88E5);
  static const Color _accentSoft = Color(0xFFDCEAFE);

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: const Text('AnimatedOpacity'),
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
                      Icons.opacity_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Aparición y desaparición suave',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Este demo muestra cómo AnimatedOpacity controla la transparencia de un widget y cómo AnimatedSwitcher cambia visualmente entre estados.',
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
                            Icons.visibility_rounded,
                            size: 18,
                            color: _accent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Presiona el botón para ocultar o mostrar',
                            style: TextStyle(
                              color: _accent,
                              fontWeight: FontWeight.w700,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // BLOQUE PRINCIPAL DEL DEMO
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
                          AnimatedOpacity(
                            opacity: _isVisible ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 650),
                            curve: Curves.easeInOut,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 650),
                              curve: Curves.easeInOut,
                              width: 200,
                              height: 180,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFFFC7B7),
                                    Color(0xFFF47F5E),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFF47F5E,
                                    ).withOpacity(0.22),
                                    blurRadius: 18,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite_rounded,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Elemento visible',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 22),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: _accentSoft,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  transitionBuilder:
                                      (
                                        Widget child,
                                        Animation<double> animation,
                                      ) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          ),
                                        );
                                      },
                                  child: _isVisible
                                      ? const Icon(
                                          Icons.sunny,
                                          key: ValueKey('sun'),
                                          size: 34,
                                          color: Color(0xFFFFB300),
                                        )
                                      : const Icon(
                                          Icons.nightlight_round,
                                          key: ValueKey('moon'),
                                          size: 34,
                                          color: Color(0xFF3949AB),
                                        ),
                                ),
                                const SizedBox(width: 12),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 400),
                                  child: Text(
                                    _isVisible
                                        ? 'Estado visible'
                                        : 'Estado oculto',
                                    key: ValueKey(_isVisible),
                                    style: const TextStyle(
                                      color: _textPrimary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),

                    GestureDetector(
                      onTap: _toggleVisibility,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 280),
                        curve: Curves.easeInOut,
                        width: _isVisible ? 190 : 210,
                        height: _isVisible ? 50 : 56,
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
                              _isVisible
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _isVisible ? 'Ocultar' : 'Mostrar',
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
