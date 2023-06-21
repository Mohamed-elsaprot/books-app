import 'package:bookly/constant.dart';
import 'package:bookly/features/auth/presntation/view/widgets/auth_body.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          backgroundColor: scaffoldColor,
          body: AuthBody(),);
  }
}
