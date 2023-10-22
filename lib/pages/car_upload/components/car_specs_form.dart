import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/widgets/car_specs_form_textfield.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(child: Column(
        children: [
          CarSpecsFormTextField(
            icon: Icon(Icons.speed), 
            hintext: 'Enter the Car Speed', 
            labeltext: 'Car Speed', 
            controller: _carSpeedController, 
            ),
          CarSpecsFormTextField(
            icon: Icon(Icons.escalator), 
            labeltext: 'Engine Type', 
            hintext: 'Enter the Engine Type',
            controller: _engineTypeController,
            ),
          CarSpecsFormTextField(
            icon: Icon(Icons.location_city_outlined), 
            labeltext: 'Mileage', 
            hintext: 'Enter the Mileage', 
            controller: _milleageController,
            ),
          CarSpecsFormTextField(
            icon: Icon(Icons.location_on), 
            hintext: 'Enter the Horse power', 
            labeltext: 'Horse power', 
            controller: _horsePowerController, 
            ),
            CarSpecsFormTextField(
            icon: Icon(Icons.local_gas_station), 
            hintext: 'Enter the Tank Capacity', 
            labeltext: 'Tank Capacity', 
            controller: _tankCapacityController, 
            ),

        ],
      ),),
    );
  }
}