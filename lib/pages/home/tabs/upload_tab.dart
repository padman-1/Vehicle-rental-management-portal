import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
  String selectedImageUrl = '';
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Upload Car',
          ),
          centerTitle: true,
          // backgroundColor: Colors.grey[700],
          // elevation: 0,
          // leading: Text(''),
        ),
        body: BlocListener<SpecsInfoCubit, SpecsInfoState>(
          listenWhen: (previous, current) =>
              previous.specsFormState != current.specsFormState,
          listener: (context, state) {
            if (state.specsFormState == SpecsFormState.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Upload Successful"),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: Column(
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
                        child: Builder(builder: (context) {
                          final specsFormState =
                              context.select<SpecsInfoCubit, SpecsFormState>(
                            (value) => value.state.specsFormState,
                          );
                          if (specsFormState == SpecsFormState.loading) {
                            return const SizedBox(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          return ElevatedButton(
                              onPressed: () async {
                                context.read<SpecsInfoCubit>().onSubmit();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.black),
                              child: const Text('Upload'));
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future Upload(XFile image) async {
    final specsState = context.read<SpecsInfoCubit>().state;

    final id = const Uuid().v4();
    final path = 'CarsImg/$id/${image.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = ref.putData(await image.readAsBytes(),
        SettableMetadata(contentType: image.mimeType));
    final snapshot = await uploadTask.whenComplete(() => null);
    selectedImageUrl = await snapshot.ref.getDownloadURL();
    print(selectedImageUrl);
  }
}
