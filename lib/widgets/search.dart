import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/data/models/car.dart';

class SearchCars extends SearchDelegate<Car> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Cars').snapshots(),
        builder: (context, snapshot) {
          final results = snapshot.data?.docs.where((DocumentSnapshot a) {
            if (a.data() == null) return false;
            String? title = (a.data() as Map)['name'];
            return title?.toLowerCase().contains(query.toLowerCase()) ?? false;
          }).toList();
          if (results == null) {
            return const SizedBox();
          }
          return ListView.builder(
              itemCount: results.length,
              itemBuilder: (_, index) {
                final result = results[index];
                ListTile(title: Text(result[index]));
                return null;
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('data');
  }
}
