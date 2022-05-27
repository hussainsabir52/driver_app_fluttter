import 'package:driver_app_flutter/components/appBar.dart';
import 'package:driver_app_flutter/views/registerdocuments/regdocumenthome_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:driver_app_flutter/views/registervehicletype/regvehicletype_viewmodel.dart';
class RegisterVehicleType extends StatefulWidget {
  const RegisterVehicleType({ Key? key }) : super(key: key);

  @override
  _RegisterVehicleTypeState createState() => _RegisterVehicleTypeState();
}

class _RegisterVehicleTypeState extends State<RegisterVehicleType> {

  late int selectedID=0;
  Map<String,bool> selected={};
  final List vehicleTypes = [
    {
      "id":1,
      "vehicleName":"Eco",
      "Description":"Hatchback car without AC."
    },
    {
      "id":2,
      "vehicleName":"Standard",
      "Description":"Sedan/Hatchback Car with AC."
    },
    {
      "id":3,
      "vehicleName":"Premium",
      "Description":"Luxurious Sedan/SUV car."
    },
    {
      "id":4,
      "vehicleName":"Auto",
      "Description":"Rickshaw."
    },
    {
      "id":5,
      "vehicleName":"Bike",
      "Description":"Motorcycle."
    },
  ];

  Widget getVehicleList(){
    List<Widget> list = <Widget>[];
    for(int i=0;i<vehicleTypes.length;i++){
      selected[vehicleTypes[i]["id"].toString()]=false;
      list.add(Column(
        children: [
          ListTile(
            key: Key(vehicleTypes[i]["id"].toString()),
            onTap: (){
              setState(() {
                selected[selectedID.toString()]=false;
                selectedID=vehicleTypes[i]["id"];
                selected[selectedID.toString()]=true;
              });
            },
        title: Text(vehicleTypes[i]['vehicleName'].toString(), style: const TextStyle(fontSize: 25),),
        subtitle: Text(vehicleTypes[i]['Description'].toString(), style: const TextStyle(fontSize: 18)),
        trailing: const Icon(Icons.check_box),
        shape: const BeveledRectangleBorder(),
        selected: selectedID==vehicleTypes[i]['id'] ? true : false,
        selectedColor: Colors.white,
        selectedTileColor: const Color.fromRGBO(70,66,91, 1),
      ),
      const SizedBox(height: 10,)
        ],
      ));
    }
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(children: list),
    );
    
  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child){
        return Scaffold(
          appBar: getAppBar(),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Choose type of vehicle you have".toUpperCase(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                getVehicleList(),
                TextButton(
                    onPressed: (){
                      if(selectedID!=0){
                        Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context)=>const RegisterDocumentsHomePage()));
                      }
                    }, 
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                  color: Color.fromRGBO(70,66,91, 1)),
                  padding: const EdgeInsets.all(10),
                  child: const Text("NEXT",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white,),),
                ))
                
              ],
            ),
          ),
        );
      },
      viewModelBuilder: ()=>RegisterVehicleTypeViewModel());
  }
}