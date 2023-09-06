import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  var list = [
    HomeTab(),
    UploadTab(),
    ReviewTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            groupAlignment: -1,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.upload),
                label: Text('Uploads'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.upload),
                label: Text('Uploads'),
              ),
            ],
          ),
          const VerticalDivider(
            width: 1,
          ),
          Expanded(
            child: list[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class ReviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Review'),
    );
  }
}

class UploadTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Upload'),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('data'),
    );
  }
}
