import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/dependencies_provider.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/cart_state.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/widgets/cart_drawer.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/cart_presenter.dart';
import 'package:shopping_cart_flutter/src/presentation/home/my_app_bar.dart';
import 'package:shopping_cart_flutter/src/presentation/products/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  final CartPresenter _cartPresenter;

  HomePage() : _cartPresenter = getIt<CartPresenter>();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CartState _cartState;

  @override
  void initState() {
    super.initState();
    _cartState = CartState.createEmpty();

    widget._cartPresenter.init(updateState);
  }

  void updateState(CartState cartState) {
    setState(() {
      _cartState = cartState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductList(),
      ),
      endDrawer: CartDrawer(_cartState),
    );
  }
}