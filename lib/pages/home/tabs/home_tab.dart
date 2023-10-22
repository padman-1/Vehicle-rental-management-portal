import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/pages/car_details_page.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Center(
      child: GridView.builder(
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
        itemBuilder: (_, i)=>GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const CarDetailsPage(),),),
          child: Container(
            height: devSize.height/2,
            margin: const EdgeInsets.all(5),
            // padding: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              // border: Border.all(),
              color: Colors.blueGrey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Container(
                  // margin: const EdgeInsets.symmetric(vertical: 20),
                  height: devSize.height / 5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/car1.png',),
                    fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Divider(),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Mercedez Benz ML350',),
                  const SizedBox(height: 10,),
                  const Text("@250/day"),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: const Text('Booked',
                    ),
                  )
                    ],
                  ),
                ),
                
                //  SizedBox(width: 5)
              ],
            ),
          ),
        ),

      ),
    );
  }
}
