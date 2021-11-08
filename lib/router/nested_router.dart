import 'package:flutter/material.dart';
import 'package:nested_routes/app_state_manager.dart';
import 'package:nested_routes/nav_tab.dart';
import 'package:nested_routes/screens/home/home_screen.dart';
import 'package:nested_routes/screens/settings/settings_screen.dart';

class NestedRouter extends RouterDelegate with ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager appStateManager;

  NestedRouter({required this.appStateManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (appStateManager.activeTab == NavTab.home) {
      appStateManager.activeTab = NavTab.settings;
    }

    if (appStateManager.activeTab == NavTab.settings) {
      appStateManager.activeTab = NavTab.home;
    }
    notifyListeners();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: _handlePopPage,
      pages: [
        if (appStateManager.activeTab == NavTab.home) HomeScreen.page(),
        if (appStateManager.activeTab == NavTab.settings) SettingsScreen.page(),
      ],
    );
  }

  @override
  Future setNewRoutePath(configuration) async => null;

  @override
  Future<bool> popRoute() {
    if (appStateManager.activeTab == NavTab.settings) {
      appStateManager.activeTab = NavTab.home;
      return Future.value(true);
    }
    notifyListeners();
    return Future.value(false);
  }
}
