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
            Color.fromRGBO(158, 55, 155, 1.0),
            Color.fromRGBO(253, 74, 97, 1.0),
            Color.fromRGBO(262, 133, 53, 1.0),
          ],
        ),
      ),
    );
  }
}
