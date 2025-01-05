import 'package:flutter/material.dart';
import 'package:explore_mundo/screens/destination_details.dart';
import 'package:explore_mundo/screens/about_page.dart';
import 'package:explore_mundo/screens/contact_page.dart';
import 'package:explore_mundo/screens/destination_tab.dart';
import 'package:explore_mundo/screens/packages_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo', home: Scaffold(body: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = const [
    DestinationTab(),
    PackagesTab(),
    AboutPage(),
    ContactPage(),
  ];

  void _onTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    _index = _index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages.elementAt(_index),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: _onTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active),
              label: 'Destinos',
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket),
              label: 'Pacotes',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_mark),
              label: 'Sobre',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Contatos',
              backgroundColor: Colors.pink,
            ),
          ],
        ));
  }
}
