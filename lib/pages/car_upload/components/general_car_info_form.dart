import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/widgets/car_specs_form_textfield.dart';

class GeneralCarInfoForm extends StatefulWidget {
  const GeneralCarInfoForm({super.key});

  @override
  State<GeneralCarInfoForm> createState() => _GeneralCarInfoFormState();
}

class _GeneralCarInfoFormState extends State<GeneralCarInfoForm> {

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
    return  SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please upload a picture of the car ',),
                            const SizedBox(
                              height: 10,
                            ),
          Container(
            height: devSize.height/3.5,
            width: devSize.width/4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/car_placeholder.png',),
                fit: BoxFit.contain,
                ),
             color: Colors.amber,
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
                                    onPressed: () {
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
            height: 20,
          ),
          Form(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                children: [
                   CarSpecsFormTextField(
              icon: Icon(Icons.business), 
              labeltext: 'Brand', 
              hintext: 'Enter the car Brand',
              // controller: _brandController,
           ),
            CarSpecsFormTextField(
              icon: Icon(Icons.numbers), 
              labeltext: 'Vehicle Number', 
              hintext: 'Enter the Vehicle Number',
           ),
            CarSpecsFormTextField(
              icon: Icon(Icons.health_and_safety), 
              labeltext: 'Insurance Number', 
              hintext: 'Enter the Insurance Number',
           ),
            CarSpecsFormTextField(
              icon: Icon(Icons.numbers_rounded), 
              labeltext: 'Chassis Number', 
              hintext: 'Enter the Chassis Number',
           ),
            CarSpecsFormTextField(
              icon: Icon(Icons.attach_money), 
              labeltext: 'Price', 
              hintext: 'Enter the amount',
           ),
                ],
              ),
            )
            ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: devSize.width /3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Center(child: const Text('Save')),
              ),
            ),

            const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}