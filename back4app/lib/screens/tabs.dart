import 'package:back4app/screens/home.dart';
import 'package:back4app/screens/registered_ceps.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentWidget = HomeScreen();
    String title = 'CEP';

    if (pageIndex == 1) {
      currentWidget = RegisteredCepsScreen();
      title = 'Endereços salvos';
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: currentWidget,
        appBar: AppBar(title: Text(title)),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            currentIndex: pageIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.history), label: '')
            ]),
      ),
    );
  }
}
