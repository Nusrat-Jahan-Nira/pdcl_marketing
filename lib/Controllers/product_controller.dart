import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Model/product.dart';


  class ProductController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var productList = <Product>[].obs;
  var productTempList = <Product>[];
  var totalAmount = RxDouble(0);
  @override
  void onInit() {
  super.onInit();
  //Get data
  var productData = _productData();
  //Store data
  productList.value = productData;
  productTempList = productData;
  }
  favourite(Product productResponse) {
  productResponse.isFavourite.value = !productResponse.isFavourite.value;
  }
  quantityAdd(Product productResponse) {
  productResponse.quantity++;
  _totalAmountGet();
  }
  quantityMinus(Product productResponse) {
  if (productResponse.quantity.value > 0) {
  productResponse.quantity--;
  _totalAmountGet();
  }
  }
  productNameSearch(String name) {
  if (name.isEmpty) {
  productList.value = productTempList;
  } else {
  productList.value = productTempList
      .where((element) =>
  element.productName.toLowerCase().contains(name.toLowerCase()))
      .toList();
  }
  }
  _totalAmountGet() {
  totalAmount.value = productList.fold(0, (previous, current) => previous + current.price * current.quantity.value);
  }
  }
  _productData() => [
    Product(
  id: '1',
  productName: 'Apple',
  productDescription:
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
  price: 250),
    Product(
  id: '2',
  productName: 'Banana',
  productDescription:
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
  price: 40),
    Product(
  id: '3',
  productName: 'Mango',
  productDescription:
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
  price: 100),
  ];

