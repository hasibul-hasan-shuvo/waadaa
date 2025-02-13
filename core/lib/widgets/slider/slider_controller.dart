import 'package:flutter/foundation.dart';

class SliderController {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  ValueListenable<int> get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex.value = index;
  }
}
