import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_rental_management_portal/data/repositories/car_repository.dart';
import 'package:vehicle_rental_management_portal/pages/car_details_page.dart';
import 'package:vehicle_rental_management_portal/pages/home/cubit/car_cubit/car_cubit.dart';
import 'package:vehicle_rental_management_portal/pages/home/tabs/upload_tab.dart';
import 'package:vehicle_rental_management_portal/widgets/search.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    List list = ["Booked", "checkedIn"];
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
                      return Center(
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
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 7),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.red),
                                              child: Text('Checked out'),
                                            ),
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadTab()));
                                            PopupMenuButton(
                                                icon: const Icon(
                                                    Icons.more_vert_outlined),
                                                itemBuilder: (BuildContext
                                                        context) =>
                                                    [
                                                      const PopupMenuItem(
                                                        value: 'Status',
                                                        child: Text('Status'),
                                                      ),
                                                      PopupMenuItem(
                                                        value: 'Edit Car',
                                                        child: Text('Edit Car'),
                                                        onTap: () =>
                                                            Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    UploadTab(),
                                                          ),
                                                        ),
                                                      ),
                                                      const PopupMenuItem(
                                                        value: 'Delete',
                                                        child: Text('Delete'),
                                                      )
                                                    ])
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

List<PopupMenuEntry> poplist = <PopupMenuEntry>[
  const PopupMenuItem(
    value: 'Status',
    child: Text('Status'),
  ),
  const PopupMenuItem(
    value: 'Edit Car',
    child: Text('Edit Car'),
  ),
  const PopupMenuItem(
    value: 'Delete',
    child: Text('Delete'),
  )
];
