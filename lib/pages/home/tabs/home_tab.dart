import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/pages/car_details_page.dart';
import 'package:vehicle_rental_management_portal/pages/home/tabs/upload_tab.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    List list = ["Booked", "checkedIn"];
    String selectedValue = list.first;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5), 
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 40,
              width: devSize.width/2,
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

               SizedBox(
                height: devSize.height,
                child:  ListView.builder(
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                   return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context,)=>const CarDetailsPage()));
                    },
                     child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1,))
                      ),
                       child:  ListTile(
                         leading: Image(image: AssetImage('assets/images/car1.png')),
                         title: Text('Mercedez Benz ML350'),
                         subtitle: Text('@250/day'),
                         trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             IconButton(onPressed: (){}, icon: const Icon(Icons.delete, color: Colors.red,)),
                             IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadTab()));
                              //  DropdownButton(
                              //     // hint: Text(selectedValue),
                              //     value: selectedValue,
                              //     // items: dropdownItems,
                              //   items: list.map<DropdownMenuItem<String>>((value) {
                              //     return DropdownMenuItem(
                              //       value: value,
                              //       child: Text(value),
                              //       );
                              //   }).toList(),
                              //   onChanged: (String? value){
                              //     setState(() {
                              //       selectedValue = value!;
                              //     });
                              //   },
                                
                              //   );
                              //  DropdownButton(
                              //   value: selectedValue,
                              //   items: list.map((value) {
                              //     return DropdownMenuItem(child: Text(value), value: value,);
                              //   } ).toList(), 
                              //  onChanged: (value){
                              //   setState(() {
                              //     selectedValue = value.toString();
                              //   });
                              //  });
                             }, 
                             icon: const Icon(Icons.edit))
                            ],
                            )
                          ),
                       ),
                     ),
                   );
                })),
              )
            // SizedBox(
            //   height: devSize.height,
            //   child: GridView.builder(
            //     itemCount: 8,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
            //     itemBuilder: (_, i)=>GestureDetector(
            //       onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const CarDetailsPage(),),),
            //       child: Container(
            //         height: devSize.height/2,
            //         margin: const EdgeInsets.all(5),
            //         // padding: const EdgeInsets.symmetric(horizontal: 50),
            //         decoration: BoxDecoration(
            //           // border: Border.all(),
            //           color: Colors.blueGrey.withOpacity(0.1),
            //           borderRadius: BorderRadius.circular(10)
            //         ),
            //         child: Column(
            //           children: [
            //             Container(
            //               // margin: const EdgeInsets.symmetric(vertical: 20),
            //               height: devSize.height / 5,
            //               decoration: const BoxDecoration(
            //                 image: DecorationImage(image: AssetImage('assets/images/car1.png',),
            //                 fit: BoxFit.contain,
            //                 ),
            //               ),
            //             ),
            //             const Divider(),
            //             Expanded(
            //               child: Column(
            //                 children: [
            //                   const Text('Mercedez Benz ML350',),
            //               const SizedBox(height: 10,),
            //               const Text("@250/day"),
            //               Container(
            //                 decoration: const BoxDecoration(
            //                   color: Colors.red,
            //                 ),
            //                 child: const Text('Booked',
            //                 ),
            //               )
            //                 ],
            //               ),
            //             ),
                        
            //             //  SizedBox(width: 5)
            //           ],
            //         ),
            //       ),
            //     ),
                  
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
