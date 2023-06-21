import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/search_cubit/search_cubit.dart';

class CustomTextSearchField extends StatelessWidget {
  const CustomTextSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search...',
            enabledBorder: borderStyle(),
            focusedBorder: borderStyle(),
        ),
          onChanged: (key){
            BlocProvider.of<SearchCubit>(context).s=key;
            if(key!='') BlocProvider.of<SearchCubit>(context).fetchSearchResult();

          }
        ,
      ),
    );
  }

  OutlineInputBorder borderStyle(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1.5,color: Colors.white70)
    );
  }
}
