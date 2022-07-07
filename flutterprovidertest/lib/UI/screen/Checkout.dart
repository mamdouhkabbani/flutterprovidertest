import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/Logic/STM/Providers/ItemModel.dart';
import 'package:providerexample/Logic/STM/Providers/CartModel.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("checkout"),
          actions: <Widget>[
            Row(
              children: [
                IconButton( icon: Icon(Icons.shopping_cart_outlined)
                  ,onPressed: (){
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
      body:Consumer<Cart>(builder:(context,cart,child){
        return  ListView.builder(itemCount:cart.basketItem.length ,itemBuilder: (context, i) {
          return Card(
              child: ListTile(
                title: Text("${cart.basketItem[i].name}"+"  "+"${cart.basketItem[i].price}"+" "+"${cart.basketItem[i].CurrencyiNITIAL}"),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    cart.remove(cart.basketItem[i]);
                  },
                ),
              ),
            );

        });
      } ,)
    );
  }
}
