import 'package:flutter/material.dart';
import './ItemModel.dart';


class Cart with ChangeNotifier{
  List<Item> _items=[];
  double _price =0.0;
  String ?_Curr="";

  void add(Item item){
    _items.add(item);
    _price+=item.price;

    notifyListeners();
  }

  void remove(Item item){
    _items.remove(item);
    _price-=item.price;

    notifyListeners();
  }
  int get count{
    return _items.length ;
}
double get  totalprice{
    return _price;
}
List<Item> get basketItem{
    return _items;
}


}