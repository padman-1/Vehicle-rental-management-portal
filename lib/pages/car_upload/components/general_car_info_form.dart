// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:vehicle_rental_management_portal/pages/car_upload/components/cubit/general_info_cubit.dart';

import 'package:vehicle_rental_management_portal/widgets/car_specs_form_textfield.dart';
import 'package:vehicle_rental_management_portal/widgets/default_paddings.dart';

class GeneralCarInfoForm extends StatefulWidget {
  GeneralCarInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  State<GeneralCarInfoForm> createState() => _GeneralCarInfoFormState();
}

// final _tabController = TabController(length: 2, vsync: null, );

class _GeneralCarInfoFormState extends State<GeneralCarInfoForm>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController brandController;
  late TextEditingController vehicleNumberController;
  late TextEditingController insuranceNumberController;
  late TextEditingController vinNumberController;
  late TextEditingController amountController;
  String selectedImageUrl = '';
  XFile? _image;
  late String carImgUrl;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
                _image != null
                    ? Builder(builder: (context) {
                        return Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(_image!.path),
                              fit: BoxFit.cover,
                            ),
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
                                        _image = await selectImageFromGallery();
                                        if (_image != null) {
                                          context
                                              .read<SpecsInfoCubit>()
                                              .onImageSelected(
                                                  File(_image?.path ?? ''));
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
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
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
                                      _image = await selectImageFromGallery();
                                      if (_image != null) {
                                        context
                                            .read<SpecsInfoCubit>()
                                            .onImageSelected(
                                                File(_image?.path ?? ''));
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
                    key: _formKey,
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
                            dropdownMenuEntries: list
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                          const DefaultTextfieldPadding(),
                          CarSpecsFormTextField(
                            hintext: 'Enter the car Brand',
                            controller: brandController,
                            onChanged:
                                context.read<SpecsInfoCubit>().onBrandChanged,
                          ),
                          const DefaultTextfieldPadding(),
                          CarSpecsFormTextField(
                            hintext: 'Enter the Vehicle Number',
                            controller: vehicleNumberController,
                            onChanged: context
                                .read<SpecsInfoCubit>()
                                .onVehicleNNumberChanged,
                          ),
                          const DefaultTextfieldPadding(),
                          CarSpecsFormTextField(
                            hintext: 'Enter the Insurance Number',
                            controller: insuranceNumberController,
                            onChanged: context
                                .read<SpecsInfoCubit>()
                                .onInsuranceNumberChanged,
                          ),
                          const DefaultTextfieldPadding(),
                          CarSpecsFormTextField(
                            hintext: 'Enter the Chassis Number',
                            controller: vinNumberController,
                            onChanged: context
                                .read<SpecsInfoCubit>()
                                .onVinNumberChanged,
                          ),
                          const DefaultTextfieldPadding(),
                          CarSpecsFormTextField(
                            hintext: 'Enter the amount',
                            controller: amountController,
                            onChanged:
                                context.read<SpecsInfoCubit>().onAmountChanged,
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: devSize.width / 4,
                  child: GestureDetector(
                    onTap: () {
                      Future Upload() async {
                        print('test-----' + 'htyfrhtf');
                        final id = const Uuid().v4();
                        final path = 'CarsImg/${id}';
                        final ref = FirebaseStorage.instance.ref().child(path);
                        UploadTask uploadTask = ref.putData(
                            await _image!.readAsBytes(),
                            SettableMetadata(contentType: _image?.mimeType));
                        final snapshot =
                            await uploadTask.whenComplete(() => null);
                        selectedImageUrl = await snapshot.ref.getDownloadURL();
                        print(selectedImageUrl);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: const Center(child: Text('Save')),
                    ),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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

Future<XFile?> selectImageFromGallery() async {
  XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  print('${file?.path}');
  print('${file}');
  if (file != null) {
    return file;
  } else {
    return null;
  }
}
