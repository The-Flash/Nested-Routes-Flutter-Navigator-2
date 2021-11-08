import 'package:flutter/material.dart';

import 'nav_tab.dart';

class AppStateManager extends ChangeNotifier {
  NavTab _activeTab = NavTab.home;

  NavTab get activeTab => _activeTab;

  set activeTab(NavTab activeTab) {
    _activeTab = activeTab;
    notifyListeners();
  }
}
