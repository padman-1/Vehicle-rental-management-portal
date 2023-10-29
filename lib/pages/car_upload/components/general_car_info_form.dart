import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    List<String> list = <String>["Mercedez Benz","Jaguar","Lexus","Chevrolet"];
    String selectedValue = list.first;
    
    return  SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please upload a picture of the car ',),
                                const SizedBox(
                                  height: 10,
                                ),
              Container(
                height: 150,
                width: 200,
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
              const Text('Please select car model'),
              Form(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: devSize.width,
                        child: DropdownButton(
                          hint: Text("Car brand"),
                          // value: selectedValue,
                          // items: dropdownItems,
                        items: list.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                            );
                        }).toList(),
                        onChanged: (String? value){
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        
                        ),
                      ),
                      // DropdownButton<String>(
                      //   value: selectedValue,
                      //   onChanged: (String? value) {
                      //     setState(() {
                      //       selectedValue = value!;
                      //     });
                      //   },
                      //   items: [
                      //     DropdownMenuItem(child: Text('data'), value: 'data',)
                      //   ],
                      // ),
                       CarSpecsFormTextField(
                        icon: Icon(Icons.business), 
                        labeltext: 'Brand', 
                        hintext: 'Enter the car Brand',
                        controller: _brandController,
                    ),
                      CarSpecsFormTextField(
                        icon: Icon(Icons.numbers), 
                        labeltext: 'Vehicle Number', 
                        hintext: 'Enter the Vehicle Number',
                        controller: _vehicleNumberController,
                    ),
                      CarSpecsFormTextField(
                        icon: Icon(Icons.health_and_safety), 
                        labeltext: 'Insurance Number', 
                        hintext: 'Enter the Insurance Number',
                        controller: _insuranceNumberController,
                    ),
                      CarSpecsFormTextField(
                        icon: Icon(Icons.numbers_rounded), 
                        labeltext: 'Chassis Number', 
                        hintext: 'Enter the Chassis Number',
                        controller: _vinNumberController,
                    ),
                      CarSpecsFormTextField(
                        icon: Icon(Icons.attach_money), 
                        labeltext: 'Price', 
                        hintext: 'Enter the amount',
                        controller: _amountController,
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
        ),
      ),
    );
  }
}
List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Mercedez Benz"),value: "Mercedez Benz"),
    DropdownMenuItem(child: Text("Jaguar"),value: "Jaguar"),
    DropdownMenuItem(child: Text("Lexus"),value: "Lexus"),
    DropdownMenuItem(child: Text("Honda"),value: "Honda"),
  ];
  return menuItems;
}