import 'package:flutter/material.dart';

class UserNameAnimation extends StatefulWidget {
  const UserNameAnimation({super.key, required this.isFlexible, required this.progress});

  final bool isFlexible;
  final double progress;

  @override
  State<UserNameAnimation> createState() => _UserNameAnimationState();
}

class _UserNameAnimationState extends State<UserNameAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double screenWidth = MediaQuery.of(context).size.width;

    _animation = Tween<Offset>(
      begin: const Offset(22, 150), // левый верх
      end: Offset(screenWidth - 100, 12+kToolbarHeight),
      // вправо + вниз (100 и 200 — это запас под ширину/высоту текста и отступы)
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.5,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }



  @override
  void didUpdateWidget(covariant UserNameAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Animate based on isFlexible
    final double targetValue = widget.isFlexible ? 1.0 : (1-widget.progress).clamp(0, 0.15);
    _controller.animateTo(
      targetValue,
      duration: const Duration(milliseconds: 80),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          left: _animation.value.dx,
          top: _animation.value.dy,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: const Column(
                children: <Widget>[
                  Text('Евгений'),
                  Text('Пациент'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
