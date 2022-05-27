import 'package:driver_app_flutter/components/appBar.dart';
import 'package:driver_app_flutter/views/home/home_view.dart';
import 'package:driver_app_flutter/views/registerhome/registerhome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterDocumentsHomePage extends StatefulWidget {
  const RegisterDocumentsHomePage({ Key? key }) : super(key: key);

  @override
  _RegisterDocumentsHomePageState createState() => _RegisterDocumentsHomePageState();
}

class _RegisterDocumentsHomePageState extends State<RegisterDocumentsHomePage> {
    late int selectedID=0;
    Map<String,bool> selected={};
  final List menuItems = [
    {
      "id":1,
      "name":"Profile Picture",
      "isCompleted": false
    },
    {
      "id":2,
      "name":"Driving License",
      "isCompleted": false
    },
    {
      "id":3,
      "name":"CNIC",
      "isCompleted": false
    },
    {
      "id":4,
      "name":"Vehicle Registration",
      "isCompleted": false
    },
    {
      "id":5,
      "name":"Terms & Condition",
      "isCompleted": false
    },
    
  ];

    Widget getVehicleList(){
    List<Widget> list = <Widget>[];
    for(int i=0;i<menuItems.length;i++){
      selected[menuItems[i]["id"].toString()]=false;
      list.add(Column(
        children: [
          ListTile(
            key: Key(menuItems[i]["id"].toString()),
            onTap: (){
              setState(() {
                menuItems[i]['isCompleted']=!menuItems[i]['isCompleted'];
                print(menuItems[i]['isCompleted'].toString());
              });
            },
        leading: const Icon(Icons.pages),
        title: Text(menuItems[i]['name'].toString(), style: const TextStyle(fontSize: 25),),
        subtitle: const Text("Get Started", style: TextStyle(fontSize: 18)),
        trailing: const Icon(Icons.arrow_right),
        shape: const BeveledRectangleBorder(),
        selected: menuItems[i]['isCompleted']==true ? true : false,
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

  Widget getButton(){
    if(isComplete()){
      return TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context)=>const MyHomePage()));
              }, 
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
            color: Color.fromRGBO(70,66,91, 1)),
            padding: const EdgeInsets.all(10),
            child: const Text("SUBMIT",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white,),),
          ));
    }
    else{
      return Container();
    }
  }

  bool isComplete() {
    var data= menuItems.where((row) => (row["isCompleted"]==false));
      if(data.isNotEmpty)
     {
        return false;
     }
    else 
     {
        return true;
     }
    }  


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child){
        return Scaffold(
          appBar: getAppBar(),
          body: SingleChildScrollView(
            child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome, Hussain".toUpperCase(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                const SizedBox(height: 20),
                Text("Required Steps".toUpperCase(), style: const TextStyle(fontSize: 20),),
                const SizedBox(height: 10),
                Text("Here's what you need to complete your account registration".toUpperCase(), 
                style: const TextStyle(fontSize: 15),),
                getVehicleList(),
                getButton()
                
              ],
            ),
          ),
          ),
        );
      },
      viewModelBuilder: ()=>RegisterHomeViewModel(), );
  }
}