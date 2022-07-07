import 'package:flutter/material.dart';
import 'Logic/STM/Providers/CartModel.dart';
import 'UI/screen/home.dart';
import 'package:provider/provider.dart';
void main()=>runApp(FirstApp());
class FirstApp extends StatelessWidget {
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context){
      return Cart();
    },
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: "Smart Home",
        home: Home(),
      ),
    );
  }
}
