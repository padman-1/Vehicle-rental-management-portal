import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/pages/car_upload/components/car_specs_form.dart';
import 'package:vehicle_rental_management_portal/pages/car_upload/components/general_car_info_form.dart';

class UploadTab extends StatefulWidget {
  @override
  State<UploadTab> createState() => _UploadTabState();
}

class _UploadTabState extends State<UploadTab>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
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
                  GeneralCarInfoForm(),

                  // second tab bar viiew widget
                  CarSpecsForm()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
