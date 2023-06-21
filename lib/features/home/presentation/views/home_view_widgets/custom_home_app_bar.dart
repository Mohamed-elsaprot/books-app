import 'package:flutter/material.dart';
import 'package:bookly/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly/core/utils/routers.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40,bottom:22,left:22,right: 22),
      child: Row(
        children: [
          logoText(20),
          const Spacer(),
          IconButton(
              onPressed: (){
               GoRouter.of(context).push(AppRouter.searchView);
              },
              icon:const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              ),
          ),
        ],
      ),
    );
  }
}
