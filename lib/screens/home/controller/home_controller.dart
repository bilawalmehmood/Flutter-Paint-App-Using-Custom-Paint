import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  final Rx<List<Offset?>> points = Rx<List<Offset?>>([]);
  // List<Offset?> get points => _points.value;
}
