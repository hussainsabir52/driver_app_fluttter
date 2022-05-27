import 'package:flutter/material.dart';

PreferredSizeWidget getAppBar(){
  return AppBar(
            backgroundColor: const Color.fromRGBO(70,66,91, 1),
            actions: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: const Text("Help ?", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                ),
              )
            ],
            title: const Text("GIRO",style: TextStyle(fontSize: 55,fontStyle: FontStyle.normal,fontFamily: 'Radley',color: Colors.white), ),
          );
}