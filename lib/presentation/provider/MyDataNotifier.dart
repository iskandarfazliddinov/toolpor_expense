import 'package:flutter/foundation.dart';
import 'package:toolpor_expense/presentation/provider/MyData.dart';

class MyDataNotifier extends ChangeNotifier {
  MyData _myData = MyData(icon: "", title: 'Belgini tanlang');

  MyData get myData => _myData;

  void updateData(MyData newData) {
    _myData = newData;
    notifyListeners();
  }
}
