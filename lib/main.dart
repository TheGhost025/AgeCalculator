import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var w = Colors.white;
  var b = Colors.black;
  var bl = Colors.blue;
  var gr = Colors.green;
  var br = Colors.brown;
  var dark_mode = true;
  var Mycontroller = TextEditingController();
  var age;

  String aged(int age){
    return (DateTime.now().year - age).toString();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: w,
        appBar: AppBar(
          title: const Text('Age Calcultor'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                      labelText: "Birth Year",
                      labelStyle: TextStyle(fontSize: 24, color: gr),
                      hintText: "Enter Your Birth Year",
                      hintStyle: TextStyle(fontSize: 24, color: gr),
                      prefixIcon: Icon(Icons.access_time,color: bl,),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 20,
                              color: gr),
                          borderRadius: BorderRadius.circular(60))),
                  keyboardType: TextInputType.number,
                  controller: Mycontroller,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(8),
                // ignore: sort_child_properties_last
                child: TextButton(child: Text("Get Age",style: TextStyle(fontSize: 24,color: w),),
                onPressed: (){
                  setState(() {
                    age = aged(int.parse(Mycontroller.text));
                  });
                },),padding: EdgeInsets.fromLTRB(30, 10, 30, 10),color: b,
              ),
              SizedBox(height: 10,),
              Text("Your Age" , style: TextStyle(fontSize: 24 ,color: b),),
              Text(age==null?"":age ,style: TextStyle(fontSize: 24,color: b),),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                if(b == Colors.black){
                  b = Colors.white;
                }
                else{
                  b=Colors.black;
                }

                if(w == Colors.white){
                  w = Colors.black;
                }
                else{
                  w = Colors.white;
                }
                dark_mode = !dark_mode;
              });
            }, child: Icon(dark_mode?Icons.dark_mode : Icons.light_mode)),
      ),
    );
  }
}