import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/widgets/car_specs_form_textfield.dart';
import 'package:vehicle_rental_management_portal/widgets/default_paddings.dart';

class CarSpecsForm extends StatefulWidget {
  const CarSpecsForm({super.key});

  @override
  State<CarSpecsForm> createState() => _CarSpecsFormState();
}

class _CarSpecsFormState extends State<CarSpecsForm> {
  late TextEditingController _carSpeedController;
  late TextEditingController _engineTypeController;
  late TextEditingController _horsePowerController;
  late TextEditingController _engineCapacityController;
  late TextEditingController _fuelLevelController;
  late TextEditingController _tankCapacityController;
   late TextEditingController _milleageController;

  @override
  void initState() {
    super.initState();
    _carSpeedController = TextEditingController();
    _engineCapacityController = TextEditingController();
    _horsePowerController = TextEditingController();
    _engineTypeController = TextEditingController();
    _fuelLevelController = TextEditingController();
    _milleageController = TextEditingController();
    _tankCapacityController = TextEditingController();
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
            child: Form(child: Column(
              children: [
                CarSpecsFormTextField(
                  hintext: 'Enter the Car Speed',                
                  controller: _carSpeedController, 
                  ),
                  const DefaultTextfieldPadding(),
                CarSpecsFormTextField(
                  hintext: 'Enter the Engine Type',
                  controller: _engineTypeController,
                  ),
                  const DefaultTextfieldPadding(),
                CarSpecsFormTextField(
                  hintext: 'Enter the Mileage', 
                  controller: _milleageController,
                  ),
                  const DefaultTextfieldPadding(),
                CarSpecsFormTextField(          
                  hintext: 'Enter the Horse power',            
                  controller: _horsePowerController, 
                  ),
                  const DefaultTextfieldPadding(),
                  CarSpecsFormTextField(
                  hintext: 'Enter the Tank Capacity', 
                  controller: _tankCapacityController, 
                  ),
                  const SizedBox(
                    height: 70,
                  ),
            
                  SizedBox(
                    width: devSize.width /3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Center(child: const Text('Upload')),
                    ),
                  )
            
              ],
            ),),
          ),
        ),
      ),
    );
  }
}