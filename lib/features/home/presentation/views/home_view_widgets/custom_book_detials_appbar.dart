import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width*.08;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (){
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              size: size,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}
