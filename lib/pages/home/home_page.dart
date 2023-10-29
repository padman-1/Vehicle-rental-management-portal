import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/helpers/responsive_helpers.dart';
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
          if (ResponsiveWidget.isSmallScreen(context))
              const SizedBox.shrink()
            else
          NavigationRail(
            extended: ResponsiveWidget.isLargeScreen(context),
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
