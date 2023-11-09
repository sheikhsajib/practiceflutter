import 'package:confetti/confetti.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfettiWidgets extends StatefulWidget {
  const ConfettiWidgets({super.key});

  @override
  State<ConfettiWidgets> createState() => _ConfettiWidgetsState();
}

class _ConfettiWidgetsState extends State<ConfettiWidgets> {
  // Code for Confetti Animation
  bool isPlayingConfetti = false;
  final confettiController = ConfettiController();

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  } // Code for Confetti Animation

  @override
  void initState() {
    confettiController.play();
    super.initState();
  }

  Widget confettiAnimation() {
    return ConfettiWidget(
      confettiController: confettiController,
      shouldLoop: true,
      //setDirection
      blastDirectionality: BlastDirectionality.explosive,
      //set emission count
      emissionFrequency: 0.02,
      numberOfParticles: 30,
      //set Speed
      gravity: 0.4, //0.0->1.0

      // blastDirection: -pi / 2, //Up
      // blastDirection: 0, //Right
      // blastDirection: pi / 2, //Down
      // blastDirection: pi, //Left
    );
  }

  Widget confettiRightAnim() {
    return ConfettiWidget(
      confettiController: confettiController,
      shouldLoop: true,
      //set emission count
      emissionFrequency: 0.02,
      numberOfParticles: 30,
      blastDirection: 0, //Right
    );
  }

  @override
  Widget build(BuildContext context) {
    return confettiAnimation();
  }
}
