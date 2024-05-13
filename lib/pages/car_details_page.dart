import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:vehicle_rental_management_portal/data/models/car.dart';
import 'package:vehicle_rental_management_portal/pages/home/tabs/upload_tab.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key, required this.car});

  final Car car;

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
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
                    width: devSize.width / 2,
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(image: Image.network(src)),
                    //   // image: DecorationImage(
                    //   //   image: AssetImage(
                    //   //     widget.Ca,
                    //   //   ),
                    //   //   fit: BoxFit.contain,
                    //   // ),
                    //   color: Colors.blueGrey,
                    // ),
                    child: Image.network(widget.car.imgurl),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: devSize.height / 2,
                      width: devSize.width,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Engine Type'),
                            trailing: Text(widget.car.engineType),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('power'),
                            trailing: Text(widget.car.power),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Speed'),
                            trailing: Text(widget.car.speed),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Tank Capacity'),
                            trailing: Text(widget.car.tankCapacity),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('Millage'),
                            trailing: Text(widget.car.millage),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
