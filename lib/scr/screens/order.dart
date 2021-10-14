import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sumptucious_shoe/scr/helpers/style.dart';
import 'package:sumptucious_shoe/scr/models/order.dart';
import 'package:sumptucious_shoe/scr/providers/app.dart';
import 'package:sumptucious_shoe/scr/providers/user.dart';
import 'package:sumptucious_shoe/scr/widgets/custom_text.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: ListView.builder(
          itemCount: user.orders.length,
          itemBuilder: (_, index) {
            OrderModel _order = user.orders[index];
            return ListTile(
              leading: CustomText(
                text: "\$${_order.total / 100}",
                weight: FontWeight.bold,
              ),
              title: Text(_order.description),
              subtitle: Text(
                  DateTime.fromMillisecondsSinceEpoch(_order.createdAt)
                      .toString()),
              trailing: CustomText(
                text: _order.status,
                color: green,
              ),
            );
          }),
    );
  }
}
