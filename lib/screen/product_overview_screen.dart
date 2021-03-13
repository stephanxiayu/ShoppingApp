import 'package:flutter/material.dart';

import 'package:shopping_app/widget/product_grid.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyShop"),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOption selectedValue) {
                setState(() {
                  if (selectedValue == FilterOption.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text("only Favorites"),
                  value: FilterOption.Favorites,
                ),
                PopupMenuItem(
                  child: Text("show all"),
                  value: FilterOption.All,
                )
              ],
            )
          ],
        ),
        body: ProductsGrid(_showOnlyFavorites));
  }
}
