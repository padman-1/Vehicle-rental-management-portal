// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vehicle_rental_management_portal/widgets/car_specs_form_textfield.dart';
import 'package:vehicle_rental_management_portal/widgets/default_paddings.dart';

class CarSpecsForm extends StatefulWidget {
  late TextEditingController carSpeedController;
  late TextEditingController engineTypeController;
  late TextEditingController horsePowerController;
  late TextEditingController engineCapacityController;
  late TextEditingController fuelLevelController;
  late TextEditingController tankCapacityController;
  late TextEditingController milleageController;
  Widget button;

  CarSpecsForm(
      {Key? key,
      required this.button,
      required this.carSpeedController,
      required this.engineCapacityController,
      required this.horsePowerController,
      required this.engineTypeController,
      required this.fuelLevelController,
      required this.milleageController,
      required this.tankCapacityController})
      : super(key: key);

  @override
  State<CarSpecsForm> createState() => _CarSpecsFormState();
}

class _CarSpecsFormState extends State<CarSpecsForm>
    with AutomaticKeepAliveClientMixin {
  // late TextEditingController _carSpeedController;
  // late TextEditingController _engineTypeController;
  // late TextEditingController _horsePowerController;
  // late TextEditingController _engineCapacityController;
  // late TextEditingController _fuelLevelController;
  // late TextEditingController _tankCapacityController;
  // late TextEditingController _milleageController;

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
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              child: Column(
                children: [
                  CarSpecsFormTextField(
                    hintext: 'Enter the Car Speed',
                    controller: widget.carSpeedController,
                  ),
                  const DefaultTextfieldPadding(),
                  CarSpecsFormTextField(
                    hintext: 'Enter the Engine Type',
                    controller: widget.engineTypeController,
                  ),
                  const DefaultTextfieldPadding(),
                  CarSpecsFormTextField(
                    hintext: 'Enter the Mileage',
                    controller: widget.milleageController,
                  ),
                  const DefaultTextfieldPadding(),
                  CarSpecsFormTextField(
                    hintext: 'Enter the Horse power',
                    controller: widget.horsePowerController,
                  ),
                  const DefaultTextfieldPadding(),
                  CarSpecsFormTextField(
                    hintext: 'Enter the Tank Capacity',
                    controller: widget.tankCapacityController,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: devSize.width / 4,
                    child: widget.button,
                  )
                ],
              ),
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
