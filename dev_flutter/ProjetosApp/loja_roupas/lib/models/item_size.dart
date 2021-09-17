class ItemSize{
  String? name;
  num? price;
  int? stock;

  ItemSize.fromMap(Map<String,dynamic> map){
    name = map['name'] as String;
    price = map['price'] as num;
    stock = map['stock'] as int;
  }
}