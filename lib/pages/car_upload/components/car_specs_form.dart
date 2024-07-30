// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_rental_management_portal/pages/car_upload/components/cubit/general_info_cubit.dart';

import 'package:vehicle_rental_management_portal/widgets/car_specs_form_textfield.dart';
import 'package:vehicle_rental_management_portal/widgets/default_paddings.dart';

class CarSpecsForm extends StatefulWidget {
  Widget button;

  CarSpecsForm({
    Key? key,
    required this.button,
  }) : super(key: key);

  @override
  State<CarSpecsForm> createState() => _CarSpecsFormState();
}

class _CarSpecsFormState extends State<CarSpecsForm>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController carSpeedController = TextEditingController();
  final TextEditingController engineTypeController = TextEditingController();
  final TextEditingController horsePowerController = TextEditingController();
  final TextEditingController engineCapacityController =
      TextEditingController();
  final TextEditingController fuelLevelController = TextEditingController();
  final TextEditingController tankCapacityController = TextEditingController();
  final TextEditingController milleageController = TextEditingController();

  @override
  void initState() {
    // carSpeedController = TextEditingController();
    // engineTypeController = TextEditingController();
    // horsePowerController = TextEditingController();
    // tankCapacityController = TextEditingController();
    // milleageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    carSpeedController.dispose();
    engineTypeController.dispose();
    horsePowerController.dispose();
    tankCapacityController.dispose();
    milleageController.dispose();
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
                  Builder(builder: (context) {
                    return CarSpecsFormTextField(
                      hintext: 'Enter the Car Speed',
                      controller: carSpeedController,
                      onChanged:
                          context.read<SpecsInfoCubit>().onCarSpeedChanged,
                    );
                  }),
                  const DefaultTextfieldPadding(),
                  Builder(builder: (context) {
                    return CarSpecsFormTextField(
                      hintext: 'Enter the Engine Type',
                      controller: engineTypeController,
                      onChanged:
                          context.read<SpecsInfoCubit>().onEngineTypeChanged,
                    );
                  }),
                  const DefaultTextfieldPadding(),
                  Builder(builder: (context) {
                    return CarSpecsFormTextField(
                      hintext: 'Enter the Mileage',
                      controller: milleageController,
                      onChanged:
                          context.read<SpecsInfoCubit>().onMilleageChanged,
                    );
                  }),
                  const DefaultTextfieldPadding(),
                  Builder(builder: (context) {
                    return CarSpecsFormTextField(
                      hintext: 'Enter the Horse power',
                      controller: horsePowerController,
                      onChanged:
                          context.read<SpecsInfoCubit>().onHorsePowerChanged,
                    );
                  }),
                  const DefaultTextfieldPadding(),
                  Builder(builder: (context) {
                    return CarSpecsFormTextField(
                      hintext: 'Enter the Tank Capacity',
                      controller: tankCapacityController,
                      onChanged:
                          context.read<SpecsInfoCubit>().onTankCapacityChanged,
                    );
                  }),
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
