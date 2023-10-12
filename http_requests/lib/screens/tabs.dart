import 'package:flutter/material.dart';
import 'package:http_requests/screens/ceps.dart';
import 'package:http_requests/screens/posts.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _pageId = 0;

  @override
  Widget build(BuildContext context) {
    Widget activeSreen = const CepsScreen();
    var pageTitle = 'CEP';

    if (_pageId == 1) {
      activeSreen = const PostsScreen();
      pageTitle = 'POSTS ';
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        body: activeSreen,
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.primary,
            currentIndex: _pageId,
            onTap: (int index) {
              setState(() {
                _pageId = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.house), label: 'CEP'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.post_add), label: 'POSTS')
            ]),
      ),
    );
  }
}
