import 'dart:io';

import 'package:explore_mundo/models/destinations.dart';
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
        appBar: AppBar(
          title: Text("Explore Mundo"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ],
        ),
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

class CustomSearchDelegate extends SearchDelegate {
  List<Destination> searchables = Destination.getDestinations();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, []);
      },
      icon: Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        size: 22,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SuggestionOrResultWidget(searchables: searchables, query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SuggestionOrResultWidget(searchables: searchables, query: query);
  }
}

class SuggestionOrResultWidget extends StatelessWidget {
  const SuggestionOrResultWidget({
    super.key,
    required this.searchables,
    required this.query,
  });

  final List<Destination> searchables;
  final String query;

  @override
  Widget build(BuildContext context) {
    final List<Destination> suggestions = query.isEmpty
        ? searchables
        : searchables
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    if (suggestions.isEmpty) return const NoResultWidget();

    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index].name),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: suggestions.length,
    );
  }
}

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No Result Found'),
    );
  }
}
