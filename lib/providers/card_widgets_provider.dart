import 'package:flutter/material.dart';

class CardWidgetsProvider extends ChangeNotifier {
  List<Widget> _cardWidgets = [];

  List<Widget> get cardWidgets => _cardWidgets;

  void addToCardWidgets(Widget widget) {
    _cardWidgets.add(widget);
    notifyListeners();
  }

  void removeFromCardWidgets(int index) {
    _cardWidgets.removeAt(index);
    notifyListeners();
  }
}
