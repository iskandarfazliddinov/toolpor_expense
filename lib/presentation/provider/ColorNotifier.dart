
import 'package:flutter/cupertino.dart';
import 'package:toolpor_expense/presentation/provider/ColorData.dart';

class ColorNotifier extends ChangeNotifier {
  ColorData _myData = ColorData(index: -1);

  ColorData get myData => _myData;

  void updateData(ColorData newData) {
    _myData = newData;
    notifyListeners();
  }
}
