import 'package:driver_app_flutter/views/login/login_view.dart';
import 'package:driver_app_flutter/views/registerhome/registerhome_viewmodel.dart';
import 'package:driver_app_flutter/views/registervehicletype/regvehicletype_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterHomePage extends StatefulWidget {
  const RegisterHomePage({ Key? key }) : super(key: key);
  @override
  _RegisterHomePageState createState() => _RegisterHomePageState();
}

class _RegisterHomePageState extends State<RegisterHomePage> {

  String dropDownValue = 'Karachi';


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child){
        return Container(
                decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.yellowAccent])),

              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/logo2.png', width: MediaQuery.of(context).size.width/1.8,),
                      const SizedBox(height: 20,),
                      const Text("Earn with us", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),),
                      const SizedBox(height: 5,),
                      const Text("Regitser today and become GIRO driver", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                      const SizedBox(height: 20,),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(1),
                              spreadRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Create new account", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                const Text("City", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                const SizedBox(width: 10,),
                            DropdownButton<String>(
                              value: dropDownValue,
                            items: <String>['Karachi'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownValue=newValue!;
                              });
                            },
                          )
                              ],
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                                ),
                                // icon: Icon(Icons.person, color: Colors.yellow,),
                                labelText: 'Full Name',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 17)
                              ),
                              cursorColor: Colors.black,
                            ),
                            const SizedBox(height: 15,),
                            TextFormField(
                              initialValue: "+92",
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                                ),
                                // icon: Icon(Icons.person, color: Colors.yellow,),
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 17)
                              ),
                              cursorColor: Colors.black,
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                            obscureText: true,
                            obscuringCharacter: '*',
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                                ),
                                // icon: Icon(Icons.person, color: Colors.yellow,),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 17)
                              ),
                              cursorColor: Colors.black,
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                                ),
                                // icon: Icon(Icons.person, color: Colors.yellow,),
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 17)
                              ),
                              cursorColor: Colors.black,
                            ),
                            const SizedBox(height: 10,),
                            TextButton(
                              onPressed: (){
                                Navigator.pushReplacement(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>const RegisterVehicleType()));
                              }, 
                              child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                            color: Colors.yellow,
                              borderRadius: BorderRadius.circular(100)),
                            padding: const EdgeInsets.all(10),
                            child: const Text("Sign up now",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.black,),),
                          )),
                            TextButton(
                              onPressed: (){
                                Navigator.pushReplacement(
                                  context, 
                                  MaterialPageRoute(builder: (context)=> const LoginPage()));
                              }, 
                              child: const Text("Back To Login", 
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15, color: Colors.black)
                              ,))

                          ],
                        ),
                      )
                    )
                    ]),
                )),
              ),
              );
      },
      viewModelBuilder: ()=>RegisterHomeViewModel(), );
  }
}