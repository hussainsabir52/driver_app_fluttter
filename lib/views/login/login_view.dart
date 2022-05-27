import 'package:driver_app_flutter/views/home/home_view.dart';
import 'package:driver_app_flutter/views/login/login_viewmodel.dart';
import 'package:driver_app_flutter/views/registerhome/registerhome_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginPageViewModel _viewModel = LoginPageViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (){
        return _viewModel;
      }, 
      builder: (context, model, child)=> Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text("CONVEY GO\nDriver App", 
              // textAlign: TextAlign.center,
              // style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),),
              Image.asset('assets/images/logo.png', width: MediaQuery.of(context).size.width/2,),
              const Text("Login Driver App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              const SizedBox(height: 15,),
              TextFormField(
                initialValue: "+92",
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                    ),
                    // icon: Icon(Icons.person, color: Colors.yellow,),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 20)
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(70,66,91, 1)),
                    ),
                    // icon: Icon(Icons.password, color: Colors.yellow,),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 20)
                  ),
                ),
                const SizedBox(height: 15,),
              TextButton(onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context)=> const MyHomePage()));
              },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            color: const Color.fromRGBO(70,66,91, 1),
              borderRadius: BorderRadius.circular(100)),
            padding: const EdgeInsets.all(10),
            child: const Text("Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white,),),
          ),),
          TextButton(onPressed: (){
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>const RegisterHomePage()));
              },
          child: const Text("Become A Driver",
          textAlign: TextAlign.center,
          style: TextStyle(decoration: TextDecoration.underline, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500, fontSize: 30,color: Color.fromRGBO(70,66,91, 1),),),)
            ],
          ),)),
      ),
        
        
        
        
        );
  }
}