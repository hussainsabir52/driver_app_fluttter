import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


void showCustomDialog(BuildContext context, Completer<GoogleMapController> _controller,LatLng StartLoc, LatLng EndLoc) {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  MarkerId startId = MarkerId("start");
  Marker startMarker = Marker(
      markerId: startId,
      position: LatLng(StartLoc.latitude, StartLoc.longitude),
      icon: BitmapDescriptor.defaultMarker,
      anchor: const Offset(0.5, 0.5),
      zIndex: 1000,);
  markers[startId]=startMarker;

    MarkerId endId = MarkerId("end");
  Marker endMarker = Marker(
      markerId: endId,
      position: LatLng(EndLoc.latitude, EndLoc.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      anchor: const Offset(0.5, 0.5),
      zIndex: 1000,);
  markers[endId]=endMarker;

  print("called");
  showDialog(context: context, 
  builder: (BuildContext context){
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: const EdgeInsets.all(10.0),
          scrollable: true,
          title: Column(
            children: [
              const Center(child: Text("Nearby Ride Request",style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold ))),
          Container(
            padding: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height/2,
              child: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          },
          markers: Set<Marker>.of(markers.values),
          initialCameraPosition: CameraPosition(
          target: StartLoc,
          zoom: 5,
          ),
          zoomControlsEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,),
          ),
            ],
          ),
          
          
          content: Column(
          children: [
            
          const SizedBox(height: 10,),
          Row(
            children: [
              Column(
                children: [
                Image.asset('assets/images/1635166466645.jpg', height: MediaQuery.of(context).size.height/12),
                const Center(child: Text("Hussain"),),
                Center(child: Row(children: const [Icon(Icons.star, color: Colors.yellow,),Text("4.5")]),),
                ],
              ),
              const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                Text("Pickup",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                Text("House A-394 Block C",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                Divider(color: Colors.black,),
                Text("Dropoff",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                Text("Dolmen Mall Clifton",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

              ],
            )
            ],
          ),
          const Text("Customer Offer: PKR 500",style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold )),
          const Padding(padding: EdgeInsets.all(5),
          child: LinearProgressIndicator(
            value: 50,
            color: Colors.yellow,
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextButton(onPressed: (){},
          child: Container(
            decoration: BoxDecoration(
            color: Colors.yellow,
              borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            child: const Text("Accept Offer",style: TextStyle(fontSize: 20,color: Colors.black,),),
          ),),
          TextButton(onPressed: (){},
          child: Container(
            decoration: BoxDecoration(
            color: Colors.yellow,
              borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            child: const Text("Offer Your Fare",style: TextStyle(fontSize: 20,color: Colors.black,),),
          ),)
          ],)
          ],
          ),
          );
      });
}
