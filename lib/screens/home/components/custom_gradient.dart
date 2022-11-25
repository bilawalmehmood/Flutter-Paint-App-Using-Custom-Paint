import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(138, 35, 135, 1.0),
            Color.fromRGBO(233, 64, 87, 1.0),
            Color.fromRGBO(242, 113, 33, 1.0),
          ],
        ),
      ),
    );
  }
}
