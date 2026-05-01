import 'package:flutter/material.dart';
import 'animated_container_screen.dart';
import 'animated_opacity_screen.dart';
import 'hero_list_screen.dart';
import 'explicit_animation_screen.dart';
import 'lottie_screen.dart';
import 'flutter_animate_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color _bgColor = Color(0xFFF3EDF7);
  static const Color _primary = Color(0xFF6F42C1);
  static const Color _primaryDark = Color(0xFF512DA8);
  static const Color _cardColor = Color(0xFFFAF7FC);
  static const Color _textPrimary = Color(0xFF2F2140);
  static const Color _textSecondary = Color(0xFF7A6B8F);
  static const Color _borderColor = Color(0xFFE8DFF1);

  @override
  Widget build(BuildContext context) {
    final demos = [
      DemoItem(
        title: 'AnimatedContainer',
        subtitle: 'Animación implícita',
        icon: Icons.animation_rounded,
        color: const Color(0xFF9C27B0),
        screen: const AnimatedContainerScreen(),
      ),
      DemoItem(
        title: 'AnimatedOpacity',
        subtitle: 'Aparición suave',
        icon: Icons.opacity_rounded,
        color: const Color(0xFF1E88E5),
        screen: const AnimatedOpacityScreen(),
      ),
      DemoItem(
        title: 'Hero Animation',
        subtitle: 'Entre pantallas',
        icon: Icons.compare_arrows_rounded,
        color: const Color(0xFFFB8C00),
        screen: const HeroListScreen(),
      ),
      DemoItem(
        title: 'AnimationController',
        subtitle: 'Animación explícita',
        icon: Icons.tune_rounded,
        color: const Color(0xFFE53935),
        screen: const ExplicitAnimationScreen(),
      ),
      DemoItem(
        title: 'Lottie',
        subtitle: 'Librería externa',
        icon: Icons.movie_creation_outlined,
        color: const Color(0xFF43A047),
        screen: const LottieScreen(),
      ),
      DemoItem(
        title: 'FlutterAnimate',
        subtitle: 'Efectos rápidos',
        icon: Icons.auto_awesome_rounded,
        color: const Color(0xFFE91E63),
        screen: const FlutterAnimateScreen(),
      ),
    ];

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const _HeaderCard(),
                  const SizedBox(height: 22),
                  const _SectionTitle(),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final demo = demos[index];
                  return _DemoCard(item: demo);
                }, childCount: demos.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.78,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [HomeScreen._primary, HomeScreen._primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: HomeScreen._primary.withOpacity(0.22),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 32),
          const SizedBox(height: 10),
          const Text(
            'Animaciones en Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Explorando animaciones implícitas, explícitas y librerías externas.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.88),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withOpacity(0.10)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_rounded, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Elvira Florez  •  Alejandra Valencia',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Demos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: HomeScreen._textPrimary,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Divider(color: HomeScreen._borderColor, thickness: 1.2),
        ),
      ],
    );
  }
}

class _DemoCard extends StatelessWidget {
  final DemoItem item;

  const _DemoCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HomeScreen._cardColor,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => item.screen),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            color: HomeScreen._cardColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: HomeScreen._borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 92,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: item.color.withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_outward_rounded,
                            size: 16,
                            color: item.color,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                item.color.withOpacity(0.14),
                                item.color.withOpacity(0.24),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(item.icon, size: 28, color: item.color),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 66,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w800,
                          color: HomeScreen._textPrimary,
                          height: 1.15,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.5,
                          color: HomeScreen._textSecondary,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DemoItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget screen;

  DemoItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.screen,
  });
}
