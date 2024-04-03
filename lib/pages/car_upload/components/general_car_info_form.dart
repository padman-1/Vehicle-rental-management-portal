import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_rental_management_portal/widgets/car_specs_form_textfield.dart';
import 'package:vehicle_rental_management_portal/widgets/default_paddings.dart';

class GeneralCarInfoForm extends StatefulWidget {
  const GeneralCarInfoForm({super.key});

  @override
  State<GeneralCarInfoForm> createState() => _GeneralCarInfoFormState();
}

class _GeneralCarInfoFormState extends State<GeneralCarInfoForm> {
  String _image = '';
  late TextEditingController _brandController;
  late TextEditingController _vehicleNumberController;
  late TextEditingController _insuranceNumberController;
  late TextEditingController _vinNumberController;
  late TextEditingController _amountController;
  // late TextEditingController _tankCapacityController;
  //  late TextEditingController _milleageController;

  @override
  void initState() {
    super.initState();
    _brandController = TextEditingController();
    _vehicleNumberController = TextEditingController();
    _insuranceNumberController = TextEditingController();
    _vinNumberController = TextEditingController();
    _amountController = TextEditingController();
    //   _milleageController = TextEditingController();
    //   _tankCapacityController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    List<String> list = <String>[
      "Mercedez Benz",
      "Jaguar",
      "Lexus",
      "Chevrolet"
    ];
    String selectedValue = list.first;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                const Text(
                  'Please upload a picture of the car ',
                ),
                const SizedBox(
                  height: 10,
                ),
                _image != ''
                    ? Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(File(_image)))),
                      )
                    : Container(
                        height: 150,
                        width: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/car_placeholder.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                          color: Colors.blueGrey,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).cardColor),
                                child: IconButton(
                                    onPressed: () async {
                                      String selectedImage =
                                          await selectImageFromGallery();
                                      if (selectedImage != '') {
                                        // Navigator.pop(context);
                                        setState(() {
                                          _image = selectedImage;
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Please select an image')));
                                      }
                                    },
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.camera_enhance,
                                      color: Theme.of(context).iconTheme.color,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Please select car model'),
                Form(
                    child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      DropdownMenu(
                        initialSelection: list.first,
                        onSelected: (String? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        dropdownMenuEntries:
                            list.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                      const DefaultTextfieldPadding(),
                      CarSpecsFormTextField(
                        hintext: 'Enter the car Brand',
                        controller: _brandController,
                      ),
                      const DefaultTextfieldPadding(),
                      CarSpecsFormTextField(
                        hintext: 'Enter the Vehicle Number',
                        controller: _vehicleNumberController,
                      ),
                      const DefaultTextfieldPadding(),
                      CarSpecsFormTextField(
                        hintext: 'Enter the Insurance Number',
                        controller: _insuranceNumberController,
                      ),
                      const DefaultTextfieldPadding(),
                      CarSpecsFormTextField(
                        hintext: 'Enter the Chassis Number',
                        controller: _vinNumberController,
                      ),
                      const DefaultTextfieldPadding(),
                      CarSpecsFormTextField(
                        hintext: 'Enter the amount',
                        controller: _amountController,
                      ),
                    ],
                  ),
                )),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: devSize.width / 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Center(child: Text('Save')),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Mercedez Benz"), value: "Mercedez Benz"),
    DropdownMenuItem(child: Text("Jaguar"), value: "Jaguar"),
    DropdownMenuItem(child: Text("Lexus"), value: "Lexus"),
    DropdownMenuItem(child: Text("Honda"), value: "Honda"),
  ];
  return menuItems;
}

selectImageFromGallery() async {
  XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (file != null) {
    return file.path;
  } else {
    return '';
  }
}
