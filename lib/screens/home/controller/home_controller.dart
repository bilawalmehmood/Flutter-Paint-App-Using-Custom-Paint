import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<List<Offset?>> _points = Rx<List<Offset?>>([]);
  List<Offset?> get points => _points.value;

  late final Rx<Color> selectedColor;
  late final Rx<double> strokWidth;

  @override
  void onInit() {
    super.onInit();
    selectedColor = Colors.black.obs;
    strokWidth = 2.0.obs;
  }

  @override
  void onClose() {
    selectedColor = Colors.white.obs;
    strokWidth = 0.0.obs;
    super.onClose();
  }

  void setColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Color Chooser"),
          content: SingleChildScrollView(
            child: Obx(
              () => BlockPicker(
                pickerColor: selectedColor.value,
                onColorChanged: (color) {
                  selectedColor(color);
                },
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.cancel,
                size: 25,
              ),
            ),
            const Text(
              "Cancel",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        );
      },
    );
  }
}
