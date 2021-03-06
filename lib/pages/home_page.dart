
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../Controllers/product_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends GetView<ProductController>  {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Marketing Pdcl"),
  //     ),
  //     body: Center(
  //   child: Column(
  //       mainAxisSize: MainAxisSize.min, // add this
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //        children: const [
  //          Text("Home Page")
  //        ],
  //   ),
  //   ),
  //
  //
  //   );
  // }
        appBar: AppBar(title: Text('ListView Shopping GetX')),
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey.withOpacity(0.1),
            height: 40,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Obx(
                        () => Text('Total Amount: ${controller.totalAmount}')))),
        body: Column(children: [
          // TextFieldSearch(
          //     textEditingController: controller.searchController,
          //     isPrefixIconVisible: true,
          //     onChanged: controller.productNameSearch),
          Expanded(
              child: Obx(() => ListView(shrinkWrap: true, children: [
                ...controller.productList
                    .map((e) => Card(
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(children: [
                          Row(children: [
                            CircleAvatar(radius: 25),
                            SizedBox(width: 7),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(e.productName,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black)),
                                      SizedBox(height: 3),
                                      Text('Rs. ${e.price}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black)),
                                      SizedBox(height: 3),
                                      Text('${e.productDescription}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54)),
                                    ])),
                            IconButton(
                                onPressed: () =>
                                    controller.favourite(e),
                                icon: Obx(() => Icon(
                                    e.isFavourite.value
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.grey)))
                          ]),
                          SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    borderRadius:
                                    BorderRadius.circular(15.0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.blue
                                            .withOpacity(0.1),
                                        radius: 15,
                                        child: Text('-',
                                            style: TextStyle(
                                                color: Colors.blue))),
                                    onTap: () =>
                                        controller.quantityMinus(e)),
                                SizedBox(width: 5),
                                Text('${e.quantity.value}'),
                                SizedBox(width: 5),
                                InkWell(
                                    borderRadius:
                                    BorderRadius.circular(15.0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.blue
                                            .withOpacity(0.1),
                                        radius: 15,
                                        child: Text('+',
                                            style: TextStyle(
                                                color: Colors.blue))),
                                    onTap: () =>
                                        controller.quantityAdd(e))
                              ])
                        ]))))
                    .toList()
              ])))
        ]));
  }
}
