import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/pages/home/tabs/upload_tab.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Details'),
        actions: [
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 50),
            margin: const EdgeInsets.only(right: 10),
            child: SizedBox(
              // width: 30,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadTab()),
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: devSize.height / 2,
                    width: devSize.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/car1.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.blueGrey,
                    ),
                    // color: Colors.amber,
                    // child: Image(image: AssetImage('assets/images/car1.png'),),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: devSize.height / 2,
                    width: devSize.width,
                    child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return const ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Milleage'),
                            trailing: Text('250km'),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
