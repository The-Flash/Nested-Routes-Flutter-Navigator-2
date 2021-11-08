import 'package:flutter/material.dart';
import 'package:nested_routes/app_state_manager.dart';
import 'package:nested_routes/nav_tab.dart';
import 'package:nested_routes/router/nested_router.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);
  static MaterialPage page() {
    return const MaterialPage(
      key: ValueKey("/index"),
      child: IndexScreen(),
    );
  }

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  late NestedRouter _nestedRouter;

  @override
  void initState() {
    super.initState();
    _nestedRouter = NestedRouter(
      appStateManager: context.read<AppStateManager>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final childBackButtonDispatcher =
        ChildBackButtonDispatcher(Router.of(context).backButtonDispatcher!);
    childBackButtonDispatcher.takePriority();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nested Routes"),
      ),
      body: Router(
        routerDelegate: _nestedRouter,
        backButtonDispatcher: childBackButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<AppStateManager>().activeTab.index,
          onTap: (index) {
            if (index == 0) {
              context.read<AppStateManager>().activeTab = NavTab.home;
            }
            if (index == 1) {
              context.read<AppStateManager>().activeTab = NavTab.settings;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ]),
    );
  }
}
