import 'dart:async';
import 'package:driver_app_flutter/views/home/home_viewmodel.dart';
import 'package:driver_app_flutter/views/ridenotifier/ridenotifier.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:permission_handler/permission_handler.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool rideHailing = true;
  bool carpooling = true;
  bool monthlyContract =true;
  final Completer<GoogleMapController> _controller = Completer();
  final HomeViewModel _viewModel = HomeViewModel();


  @override
  void initState(){
    super.initState();
    Permission.location.request(); 
  }

  Future<void> didUpdateMapPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _viewModel.center,zoom: 11.0 )));
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child)=> Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: const Color.fromRGBO(70,66,91, 1),
          child: SafeArea(
            child: ListView(
              children: [
                const SizedBox(height: 30,),
                Center(
                  child: Column(children: const [
                    // Image.asset('assets/images/1635166466645.jpg', height: MediaQuery.of(context).size.height/8),
                    Padding(
              padding: EdgeInsets.all(5),
              child: Center(
              child: CircleAvatar(backgroundImage: AssetImage('assets/images/1635166466645.jpg'),
              radius: 50,),
            ),),
                    Text("Hussain", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold ))
                  ],)
                ),

                const Divider(color: Colors.white,),
                const ListTile(
                  leading: Icon(Icons.person, size: 30,color: Colors.white,),
                  title:Text("Driver Portal", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold )),
                  trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
                ),
                const ListTile(
                  leading: Icon(Icons.flag, size: 30,color: Colors.white,),
                  title:Text("LeaderBoard", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold )),
                  trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
                ),
                const ListTile(
                  leading: Icon(Icons.notification_add, size: 30,color: Colors.white,),
                  title:Text("Customer Requests", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold )),
                  trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
                ),
                const ListTile(
                  leading: Icon(Icons.error, size: 30,color: Colors.white,),
                  title:Text("Issue Box", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold )),
                  trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
                ),
                const ListTile(
                  leading: Icon(Icons.help, size: 30,color: Colors.white,),
                  title:Text("Support", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold )),
                  trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
                ),
                const ListTile(
                  leading: Icon(Icons.person_add, size: 30,color: Colors.white,),
                  title:Text("Refer Driver", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold )),
                  trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
                ),
                const ListTile(
                  leading: Icon(Icons.settings, size: 30,color: Colors.white,),
                  title:Text("Setting", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold )),
                  trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
                ),
                const Divider(color: Colors.white,),
                const ListTile(
                  leading: Icon(Icons.logout, size: 30,color: Colors.white,),
                  title:Text("Sign Out", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold )),
                ),

              ],
            )),),
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const <Widget> [
            Text("Welcome", 
            style: TextStyle(
              fontSize: 15, 
              fontWeight: FontWeight.bold, 
              color: Colors.black),),
            Text("Hussain Sabir", 
            style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic, 
              color: Colors.black),)
          ])
          ),
          leading: IconButton(
                    onPressed: () => {_key.currentState?.openDrawer()},
                    icon: const Icon(Icons.menu, color: Colors.black,),
                  ),
          actions: [
            IconButton(
                    onPressed: () =>{showCustomDialog(context,_controller,model.start,model.end)},
                    icon: const Icon(Icons.notification_important, color: Colors.black,),
                  ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Center(
              child: CircleAvatar(backgroundImage: AssetImage('assets/images/1635166466645.jpg'),),
            ),)
          ],
        ),

        bottomSheet: Wrap(
          children: [
            Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10,right: 10, bottom: 15, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(32, 29, 46, 1)),
                
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: const EdgeInsets.all(0),child: Image.asset('assets/images/rideHailing.png',width: MediaQuery.of(context).size.width/4.5),),
                  Text("Ride Hailing".toUpperCase(), style: const TextStyle(color: Colors.white,fontSize: 18, fontWeight:FontWeight.bold ),),
                  Switch(value: rideHailing, onChanged: (value){ setState(() {
                    rideHailing=value;
                  }); },
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red,)
                ],
              ),),),
              Padding(
                padding: const EdgeInsets.only(left:10,right: 10, bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(32, 29, 46, 1)),
                
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: const EdgeInsets.all(0),child: Image.asset('assets/images/carpooling.png', width: MediaQuery.of(context).size.width/4.5,),),
                  Text("Carpooling".toUpperCase(), style: const TextStyle(color: Colors.white,fontSize: 18, fontWeight:FontWeight.bold ),),
                  Switch(value: carpooling, onChanged: (value){ setState(() {
                    carpooling=value;
                  }); },
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red,)
                ],
              ),),),
              Padding(
                padding: const EdgeInsets.only(left:10,right: 10, bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(32, 29, 46, 1)),
                
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: const EdgeInsets.all(0),child: Image.asset('assets/images/monthly.png', width: MediaQuery.of(context).size.width/4.5,),),
                  Text("Monthly Booking".toUpperCase(), style: const TextStyle(color: Colors.white,fontSize: 18, fontWeight:FontWeight.bold ),),
                  Switch(value: monthlyContract, onChanged: (value){ setState(() {
                    monthlyContract=value;
                  }); },
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red,)
                ],
              ),),)
            ],
          ),
         
          ],
        ),

        body: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: CameraPosition(
              target: model.center,
              zoom: 12.0,
            ),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,),
      ),
      
      viewModelBuilder: (){
        _viewModel.locationUpdateCallback=didUpdateMapPosition;
        return _viewModel;
      },
      );
  }
}
