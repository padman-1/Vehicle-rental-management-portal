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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder(
          future: fetchSearchResults(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error fetching data'));
            } else {
              List<DocumentSnapshot> results = snapshot.data!;
              return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot result = results[index];
                    return ListTile(
                      title: Text(result['name']),
                      subtitle: Text(result['descip']),
                    );
                  });
            }
          }),
    );
    // return StreamBuilder(
    //     stream: FirebaseFirestore.instance.collection('Cars').snapshots(),
    //     builder: (context, snapshot) {
    //       final results = snapshot.data?.docs.where((DocumentSnapshot a) {
    //         if (a.data() == null) return false;
    //         String? title = (a.data() as Map)['name'];
    //         return title?.toLowerCase().contains(query.toLowerCase()) ?? false;
    //       }).toList();
    //       print('************************************');
    //       print(results);
    //       if (results == null) {
    //         return const SizedBox();
    //       }
    //       return ListView.builder(
    //           itemCount: results.length,
    //           itemBuilder: (_, index) {
    //             final result = results[index];
    //             ListTile(title: Text(result[index]));
    //             // return null;
    //           });
    //     });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FutureBuilder(
          future: fetchSearchResults(query),
          builder: (context, snapshot) {
            if (snapshot.hasError || snapshot.data == null) {
              return Center(
                child: Text('No suggestions available.'),
              );
            }
            List<DocumentSnapshot> results = snapshot.data!;
            return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot result = results[index];
                  return ListTile(
                    title: Text(result['name']),
                    subtitle: Text(result['descip']),
                    onTap: () {
                      query = result['name'];
                    },
                  );
                });
          }),
    );
    // return StreamBuilder(
    //     stream: FirebaseFirestore.instance.collection('Cars').snapshots(),
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) return const Text('Loading...');
    //       final results = snapshot.data?.docs.where((DocumentSnapshot a) {
    //         if (a.data() == null)
    //           return false;
    //         else {
    //           String? title = (a.data() as Map)['name'];
    //           return title?.toLowerCase().contains(query.toLowerCase()) ??
    //               false;
    //         }
    //       }).toList();
    //       if (results == null) {
    //         return const SizedBox();
    //       }
    //       return ListView.builder(
    //           itemCount: results.length,
    //           itemBuilder: (_, index) {
    //             final result = results[index];
    //             ListTile(title: Text(result[index]));
    //             // return null;
    //           });
    //     });
  }

  Future<List<DocumentSnapshot>> fetchSearchResults(String query) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Cars')
          .where('name', isEqualTo: query)
          .get();
      return querySnapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
