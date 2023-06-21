import 'package:bookly/features/search/presentation/views/widgets/search_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/search_cubit/search_cubit.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                  flex: 8,
                  child: CustomTextSearchField()),
              Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: (){
                       BlocProvider.of<SearchCubit>(context).fetchSearchResult();
                    },
                    icon: const Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.white70,)),
              )
            ],
          ),
           const SizedBox(height: 15,),
           const Text('Books', style: Styles.titleMedium),
           const SizedBox(height: 15,),
           const Expanded(child: SearchListResult())

    ],
      ),
    );
  }
}




