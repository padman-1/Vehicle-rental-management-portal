import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:vehicle_rental_management_portal/pages/car_upload/components/car_specs_form.dart';
import 'package:vehicle_rental_management_portal/pages/car_upload/components/cubit/general_info_cubit.dart';
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
  String selectedImageUrl = '';
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

    final specsState = context.read<SpecsInfoCubit>().state;

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
                  GeneralCarInfoForm(),

                  // second tab bar viiew widget
                  CarSpecsForm(
                    button: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: isloading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () async {
                                Future Upload() async {
                                  print('test-----' + 'htyfrhtf');
                                  final id = const Uuid().v4();
                                  final path = 'CarsImg/${id}';
                                  final ref = FirebaseStorage.instance
                                      .ref()
                                      .child(path);
                                  UploadTask uploadTask = ref.putData(
                                      await specsState.imageFile!.readAsBytes(),
                                      SettableMetadata(
                                          contentType:
                                              specsState.imageFile?.mimeType));
                                  final snapshot =
                                      await uploadTask.whenComplete(() => null);
                                  selectedImageUrl =
                                      await snapshot.ref.getDownloadURL();
                                  print(selectedImageUrl);
                                }

                                var docRef = db.collection("Cars").doc();
                                final data = ({
                                  "speed": specsState.carSpeedController,
                                  "tankCapacity":
                                      specsState.tankCapacityController,
                                  "fuelLevel": specsState.fuelLevelController,
                                  "engineType":
                                      specsState.engineCapacityController,
                                  "millage": specsState.milleageController,
                                  "power": specsState.horsePowerController,
                                  "brand": specsState.brandController,
                                  "vin": specsState.vinNumberController,
                                  "insurance":
                                      specsState.insuranceNumberController,
                                  "name": '',
                                  "imgurl": selectedImageUrl,
                                  // "descip": description.text,
                                  // "city": location.text,
                                  "amount": specsState.amountController,
                                  "currency": 'Ghc',
                                  // "dur": '1',
                                  "carid": docRef.id,
                                  "status": "checkedIn",
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
