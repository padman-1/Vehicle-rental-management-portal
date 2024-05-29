import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/pages/car_upload/components/car_specs_form.dart';
import 'package:vehicle_rental_management_portal/pages/car_upload/components/general_car_info_form.dart';
import 'package:vehicle_rental_management_portal/pages/home/cubit/car_cubit/car_cubit.dart';

class UploadTab extends StatefulWidget {
  @override
  State<UploadTab> createState() => _UploadTabState();
}

class _UploadTabState extends State<UploadTab>
    with SingleTickerProviderStateMixin {
  var db = FirebaseFirestore.instance;
  late final _tabController = TabController(length: 2, vsync: this);
  final _brandController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _insuranceNumberController = TextEditingController();
  final _vinNumberController = TextEditingController();
  final _amountController = TextEditingController();
  final _carSpeedController = TextEditingController();
  final _engineCapacityController = TextEditingController();
  final _horsePowerController = TextEditingController();
  final _engineTypeController = TextEditingController();
  final _fuelLevelController = TextEditingController();
  final _milleageController = TextEditingController();
  final _tankCapacityController = TextEditingController();
  bool isloading = false;

  @override
  void dispose() {
    _amountController.dispose();
    _brandController.dispose();
    _carSpeedController.dispose();
    _engineCapacityController.dispose();
    _engineTypeController.dispose();
    _vehicleNumberController.dispose();
    _insuranceNumberController.dispose();
    _vinNumberController.dispose();
    _horsePowerController.dispose();
    _fuelLevelController.dispose();
    _milleageController.dispose();
    _tankCapacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Upload Car',
          ),
          centerTitle: true,
          // backgroundColor: Colors.grey[700],
          // elevation: 0,
          // leading: Text(''),
        ),
        body: Column(
          children: <Widget>[
            // // construct the profile details widget here
            // SizedBox(
            //   height: 180,
            //   child: Center(
            //     child: Text(
            //       'Profile Details Goes here',
            //     ),
            //   ),
            // ),

            // the tab bar with two items
            SizedBox(
              height: 50,
              child: AppBar(
                bottom: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: 'General Car Information',
                      //icon: Icon(Icons.directions_bike),
                    ),
                    Tab(
                      text: 'Car Specifications',
                      // icon: Icon(
                      //   Icons.directions_car,
                      // ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  GeneralCarInfoForm(
                    brandController: _brandController,
                    vehicleNumberController: _vehicleNumberController,
                    insuranceNumberController: _insuranceNumberController,
                    vinNumberController: _vinNumberController,
                    amountController: _amountController,
                    selectedImage: '',
                  ),

                  // second tab bar viiew widget
                  CarSpecsForm(
                    button: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: isloading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () async {
                                var docRef = db.collection("Cars").doc();
                                final data = ({
                                  "speed": _carSpeedController.text,
                                  "tankCapacity": _tankCapacityController.text,
                                  "fuelLevel": _fuelLevelController.text,
                                  "engineType": _engineTypeController.text,
                                  "millage": _milleageController.text,
                                  "power": _horsePowerController.text,
                                  "brand": _brandController.text,
                                  "vin": _vinNumberController.text,
                                  "insurance": _insuranceNumberController.text,
                                  "name": '',
                                  // "imgurl": '',
                                  // "descip": description.text,
                                  // "city": location.text,
                                  "amount": _amountController.text,
                                  "currency": 'Ghc',
                                  // "dur": '1',
                                  "carid": docRef.id,
                                  // "ownerid": loggeduser.uid
                                });
                                setState(() {
                                  isloading = true;
                                });
                                await docRef.set(data);
                                setState(() {
                                  isloading = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.black),
                              child: const Text('Upload')),
                    ),
                    carSpeedController: _carSpeedController,
                    engineCapacityController: _engineCapacityController,
                    horsePowerController: _horsePowerController,
                    engineTypeController: _engineTypeController,
                    fuelLevelController: _fuelLevelController,
                    milleageController: _milleageController,
                    tankCapacityController: _tankCapacityController,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
