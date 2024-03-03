// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductData {
  String productName;
  String productDescription;
  double price;
  bool iscart;
  bool isfav;
  String imgurl;

  ProductData(
      {required this.productName,
      required this.productDescription,
      required this.price,
      required this.iscart,
      required this.isfav,
      required this.imgurl});

  ProductData copyWith({
    String? productName,
    String? productDescription,
    double? price,
    bool? iscart,
    bool? isfav,
  }) {
    return ProductData(
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      price: price ?? this.price,
      iscart: iscart ?? this.iscart,
      isfav: isfav ?? this.isfav,
      imgurl: imgurl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'productDescription': productDescription,
      'price': price,
      'iscart': iscart,
      'isfav': isfav,
      "imgurl": imgurl,
    };
  }

  factory ProductData.fromMap(Map<String, dynamic> map) {
    return ProductData(
      productName: map['productName'] ?? '',
      productDescription: map['productDescription'] ?? '',
      price: map['price'] != null ? map['price'].toDouble() : 0.0,
      iscart: map['iscart'] ?? false,
      isfav: map['isfav'] ?? false,
      imgurl: map['imgurl'] ??
          "https://www.shutterstock.com/image-photo/red-apple-isolated-on-white-600nw-1727544364.jpg",
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductData.fromJson(String source) =>
      ProductData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductData(productName: $productName, productDescription: $productDescription, price: $price, iscart: $iscart, isfav: $isfav, imgurl:$imgurl)';
  }

  @override
  bool operator ==(covariant ProductData other) {
    if (identical(this, other)) return true;

    return other.productName == productName &&
        other.productDescription == productDescription &&
        other.price == price &&
        other.iscart == iscart &&
        other.isfav == isfav &&
        other.imgurl == imgurl;
  }

  @override
  int get hashCode {
    return productName.hashCode ^
        productDescription.hashCode ^
        price.hashCode ^
        iscart.hashCode ^
        isfav.hashCode ^
        imgurl.hashCode;
  }
}
