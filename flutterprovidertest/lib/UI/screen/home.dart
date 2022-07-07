import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/UI/screen/Checkout.dart';
import 'package:providerexample/Logic/STM/Providers/ItemModel.dart';
import 'package:providerexample/Logic/STM/Providers/CartModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(
        name: "IPHONE 11",
        price: 2499,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 11 PRO",
        price: 3619,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 11 PRO MAX",
        price: 4439,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 12 MINI",
        price: 3200,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 12",
        price: 4029,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 12 PRO",
        price: 4200,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 12 PRO MAX",
        price: 4700,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 13 MINI",
        price: 4269,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 13",
        price: 3819,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 13 PRO",
        price: 4619,
        CurrencyiNITIAL: "AED"),
    Item(
        name: "IPHONE 13 PRO MAX",
        price: 5119,
        CurrencyiNITIAL: "AED"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),



        actions: <Widget>[
          Row(
            children: [
              IconButton( icon: Icon(Icons.shopping_cart_outlined)
                ,onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder:
                (context){
                  return CheckOut();
                }));
                },),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Consumer<Cart>(builder:(context,cart,child){
                  return Text("${cart.count}",
                    style: TextStyle(color: Colors.red
                    )
                  );
                } ,)
              ),
              IconButton( icon:Icon(Icons.monetization_on_sharp),
                onPressed: () {  },),
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Consumer<Cart>(builder:(context,cart,child){

                    return Text("${cart.totalprice}"+"AED",
                        style: TextStyle(color: Colors.red
                        )
                    );
                  } ,)
              ),

            ],
          )]
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Card(
              child:Consumer<Cart>(builder: (context,cart,child){
                return  ListTile(
                  title: Text("${items[i].name}"+"  "+"${items[i].price}"+" "+"${items[i].CurrencyiNITIAL}"),
                  trailing: IconButton(
                    icon: Icon(Icons.add_outlined),
                    onPressed: () {
                      cart.add(items[i]);

                    },
                  ),
                );
              },)
            );
          }),
    );
  }
}
