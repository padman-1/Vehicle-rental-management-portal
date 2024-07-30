import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

part 'general_info_state.dart';

class SpecsInfoCubit extends Cubit<SpecsInfoState> {
  SpecsInfoCubit()
      : super(const SpecsInfoState(
          amountController: '',
          brandController: '',
          vehicleNumberController: '',
          insuranceNumberController: '',
          vinNumberController: '',
          carSpeedController: '',
          engineTypeController: '',
          horsePowerController: '',
          engineCapacityController: '',
          fuelLevelController: '',
          tankCapacityController: '',
          milleageController: '',
          imageFile: null,
          specsFormState: SpecsFormState.initial,
        ));

  var db = FirebaseFirestore.instance;

  void onAmountChanged(String amountController) {
    emit(state.copyWith(amountController: amountController));
  }

  void onBrandChanged(String brandController) {
    emit(state.copyWith(brandController: brandController));
  }

  void onVehicleNNumberChanged(String vehicleNumberController) {
    emit(state.copyWith(vehicleNumberController: vehicleNumberController));
  }

  void onInsuranceNumberChanged(String insuranceNumberController) {
    emit(state.copyWith(insuranceNumberController: insuranceNumberController));
  }

  void onVinNumberChanged(String vinNumberController) {
    emit(state.copyWith(vinNumberController: vinNumberController));
  }

  void onCarSpeedChanged(String carSpeedController) {
    emit(state.copyWith(carSpeedController: carSpeedController));
  }

  void onEngineTypeChanged(String engineTypeController) {
    emit(state.copyWith(engineTypeController: engineTypeController));
  }

  void onHorsePowerChanged(String horsePowerController) {
    emit(state.copyWith(horsePowerController: horsePowerController));
  }

  void onEngineCapacityChanged(String engineCapacityController) {
    emit(state.copyWith(engineCapacityController: engineCapacityController));
  }

  void onFuelLevelChanged(String fuelLevelController) {
    emit(state.copyWith(fuelLevelController: fuelLevelController));
  }

  void onTankCapacityChanged(String tankCapacityController) {
    emit(state.copyWith(tankCapacityController: tankCapacityController));
  }

  void onMilleageChanged(String milleageController) {
    emit(state.copyWith(milleageController: milleageController));
  }

  void onImageSelected(XFile file) {
    emit(state.copyWith(imageFile: file));
  }

//  final specsState = context.read<SpecsInfoCubit>().state;
  Future<void> onSubmit() async {
    emit(state.copyWith(specsFormState: SpecsFormState.loading));
    String selectedImageUrl = await Upload(state.imageFile!);
    var docRef = db.collection("Cars").doc();
    // print(state);
    final data = ({
      "speed": state.carSpeedController,
      "tankCapacity": state.tankCapacityController,
      // "fuelLevel": state.fuelLevelController,
      "engineType": state.engineTypeController,
      "millage": state.milleageController,
      "power": state.horsePowerController,
      "brand": state.brandController,
      "vin": state.vinNumberController,
      "insurance": state.insuranceNumberController,
      // "name": '',
      "imgurl": selectedImageUrl,
      // "descip": description.text,
      // "city": location.text,
      "amount": state.amountController,
      "currency": 'Ghc',
      // "dur": '1',
      "carid": docRef.id,
      "status": "checkedIn",
      // "ownerid": loggeduser.uid
    });
    await docRef.set(data);
    emit(state.copyWith(specsFormState: SpecsFormState.success));
  }

  Future<String> Upload(XFile image) async {
    // final specsState = context.read<SpecsInfoCubit>().state;

    final id = const Uuid().v4();
    final path = 'CarsImg/$id/${image.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = ref.putData(await image.readAsBytes(),
        SettableMetadata(contentType: image.mimeType));
    final snapshot = await uploadTask.whenComplete(() => null);
    return await snapshot.ref.getDownloadURL();
  }
}
