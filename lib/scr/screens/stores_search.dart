import 'package:flutter/material.dart';
import 'package:foodapp/scr/helpers/style.dart';
import 'package:foodapp/scr/providers/app.dart';
import 'package:foodapp/scr/providers/product.dart';
import 'package:foodapp/scr/providers/store.dart';
import 'package:foodapp/scr/screens/store.dart';
import 'package:foodapp/scr/widgets/custom_text.dart';
import 'package:foodapp/scr/widgets/loading.dart';
import 'package:foodapp/scr/widgets/store.dart';

import 'package:provider/provider.dart';

class StoresSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: CustomText(
          text: "Stores",
          size: 20,
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: app.isLoading
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Loading()],
              ),
            )
          : storeProvider.searchedStores.length < 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: grey,
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(
                          text: "No Stores Found",
                          color: grey,
                          weight: FontWeight.w300,
                          size: 22,
                        ),
                      ],
                    )
                  ],
                )
              : ListView.builder(
                  itemCount: storeProvider.searchedStores.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () async {
                          app.changeLoading();
                          await productProvider.loadProductsByStore(
                              storeId: storeProvider.searchedStores[index].id);
                          app.changeLoading();

                          changeScreen(
                              context,
                              StoreScreen(
                                storeModel: storeProvider.searchedStores[index],
                              ));
                        },
                        child: StoreWidget(
                            store: storeProvider.searchedStores[index]));
                  }),
    );
  }

  void changeScreen(BuildContext context, storeScreen) {}
}
