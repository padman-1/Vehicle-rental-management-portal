import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/pages/home/tabs/home_tab.dart';
import 'package:vehicle_rental_management_portal/pages/home/tabs/upload_tab.dart';

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
                icon: Icon(Icons.settings),
                label: Text('Review'),
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
