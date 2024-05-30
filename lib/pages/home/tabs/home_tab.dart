import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_rental_management_portal/data/models/car.dart';
import 'package:vehicle_rental_management_portal/data/models/car_status.dart';
import 'package:vehicle_rental_management_portal/data/repositories/car_repository.dart';
import 'package:vehicle_rental_management_portal/pages/car_details_page.dart';
import 'package:vehicle_rental_management_portal/pages/home/cubit/car_cubit/car_cubit.dart';
import 'package:vehicle_rental_management_portal/pages/home/tabs/upload_tab.dart';
import 'package:vehicle_rental_management_portal/widgets/search.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
  });
  // final Car car;
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    // List list = ["Booked", "checkedIn"];
    // final Car car;
    return RepositoryProvider(
      create: (context) => CarRepository(),
      child: BlocProvider(
        create: (context) =>
            CarCubit(carRepository: context.read<CarRepository>()),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () =>
                      showSearch(delegate: SearchCars(), context: context),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 40,
                    width: devSize.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.search),
                        Text('Search Cars'),
                        Icon(Icons.settings),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<CarCubit, CarState>(
                  builder: (context, state) {
                    print(state);
                    if (state is CarLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CarSuccess) {
                      if (state.cars.isEmpty) {
                        return const Center(
                          child: Text('No cars found'),
                        );
                      }
                      return SizedBox(
                        height: devSize.height,
                        child: ListView.builder(
                            itemCount: state.cars.length,
                            itemBuilder: ((context, index) {
                              final car = state.cars[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (
                                        context,
                                      ) =>
                                              CarDetailsPage(
                                                car: car,
                                              )));
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    width: 1,
                                  ))),
                                  child: ListTile(
                                    leading: Image.network(car.imgurl),
                                    title: Text(car.name),
                                    subtitle: Row(
                                      children: [
                                        Text(car.currency),
                                        Text(car.amount)
                                      ],
                                    ),
                                    trailing: SizedBox(
                                        width: 120,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            car.status == "checkedOut"
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 7),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.red),
                                                    child: Text(car.status),
                                                  )
                                                : Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 7),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Colors.green[400]),
                                                    child: Text(car.status),
                                                  ),
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadTab()));
                                            PopupMenuButton(
                                              itemBuilder: (context) {
                                                return CarStatus.values
                                                    .map((e) => PopupMenuItem(
                                                        value: e,
                                                        child: Text(e.name)))
                                                    .toList();
                                              },
                                              onSelected: (value) async {
                                                await onUpdate(
                                                    status: value,
                                                    carId: car.carId);
                                                final snackBar = SnackBar(
                                                    content: const Text(
                                                        "Status updated successfully!"));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                                print(car.status);
                                                print(car.carId);
                                                // onUpdate(
                                                //     status: value,
                                                //     carId: car.carId);
                                              },
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              );
                            })),
                      );
                    }
                    return SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future onUpdate({required CarStatus status, required String carId}) async {
  final doc = FirebaseFirestore.instance.collection("Cars").doc(carId);

  await doc.update({'status': status.name});
}
