import 'package:bookly/core/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../../core/widgets/customTextField.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? email, password;
    final GlobalKey<FormState> formKey = GlobalKey();

    return BlocConsumer<AuthCubit,AuthState>(
        listener: (BuildContext context, state) {
          if(state is AuthFailure){
            customSnackBar(context, state.error);
          }
          else if(state is AuthSuccess){
            GoRouter.of(context).push(AppRouter.homeViewRouter);
          }
        },
        builder:(context,state) {
          bool login= BlocProvider.of<AuthCubit>(context).login;
          return Form(
            key: formKey,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric( horizontal: size.width * .06),
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
               Text(
                  login?  'LOG IN' : 'SIGN UP', style: TextStyle(fontSize: size.width*.1,),textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * .1,
                ),
                CustomTextField(
                  onChange: (data) {
                    email=data;
                  },
                  label: 'email',
                  icon: const Icon(Icons.account_circle,),
                ),
                SizedBox(
                  height: size.height * .1,
                ),
                CustomTextField(
                  onChange: (data) {
                    password=data;
                  },
                  label: 'password',
                  secure: true,
                  icon: const Icon(Icons.security),
                ),
                SizedBox(
                  height: size.height * .12,
                ),
                (state is AuthLoading)? const  Center(child: CircularProgressIndicator()):
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*.12),
                  child: CustomButton(
                    text: login ? 'LOG IN' : 'SIGN UP',
                    onPressed: () {
                      if (formKey.currentState!.validate()){
                        BlocProvider.of<AuthCubit>(context).authFun(email: email!, password: password!);
                      }
                    },
                     color: Colors.deepOrange, textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * .14,
                ),
                Text(
                  login ? 'don\'t have an account?' : 'already a user?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: size.width * .045,
                      fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*.3),
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).changeMode();
                    },
                    child: Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black.withOpacity(.6), width: 1.4))
                        ),
                        child: Text(
                          login ? 'SIGN UP' : 'LOG IN',
                          // size: size.width * .043,
                          // color: coffeeColor.withOpacity(.6),
                        )),
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
