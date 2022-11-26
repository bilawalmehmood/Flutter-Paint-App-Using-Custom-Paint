import 'package:flutter/material.dart';
import 'package:flutter_painting_app/models/drwing_area_model.dart';
import 'package:flutter_painting_app/screens/home/components/custom_gradient.dart';
import 'package:flutter_painting_app/screens/home/components/my_custom_painter.dart';
import 'package:flutter_painting_app/screens/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller = Get.put(HomeController());
  List<DrwingAreaModel?> points = [];
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const GradientBackground(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * .8,
                    height: Get.height * .8,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ),
                        ]),
                    child: GestureDetector(
                      onPanDown: (details) {
                        setState(() {
                          points.add(DrwingAreaModel(
                            point: details.localPosition,
                            areaPaint: Paint()
                              ..color = controller.selectedColor.value
                              ..strokeCap = StrokeCap.round
                              ..strokeWidth = controller.strokWidth.value
                              ..isAntiAlias = true,
                          ));
                        });
                      },
                      onPanUpdate: (details) {
                        setState(() {
                          points.add(DrwingAreaModel(
                            point: details.localPosition,
                            areaPaint: Paint()
                              ..color = controller.selectedColor.value
                              ..strokeCap = StrokeCap.round
                              ..strokeWidth = controller.strokWidth.value
                              ..isAntiAlias = true,
                          ));
                        });
                      },
                      onPanEnd: (details) {
                        setState(() {
                          points.add(null);
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CustomPaint(
                          painter: MyCustomPainter(
                            points: points,
                            selctedColor: controller.selectedColor.value,
                            strokeWidth: controller.strokWidth.value,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: Get.width * .8,
                    height: Get.height * .07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => IconButton(
                            onPressed: () => controller.setColor(context),
                            icon: const Icon(
                              Icons.color_lens,
                            ),
                            color: controller.selectedColor.value,
                          ),
                        ),
                        Obx(
                          () => Expanded(
                            child: Slider(
                              min: 1.0,
                              max: 7.0,
                              value: controller.strokWidth.value,
                              activeColor: controller.selectedColor.value,
                              onChanged: (value) {
                                controller.strokWidth(value);
                              },
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                points.clear();
                              });
                            },
                            icon: const Icon(Icons.layers_clear))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
