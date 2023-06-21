import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel,}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
                text: '19.99\$',
                color: Colors.white,
                textColor: Colors.black,
                radius: BorderRadius.only(
                    topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)
                ),
                onPressed: null,
              )),
          Expanded(
            child: CustomButton(
              text: getText(bookModel),
              color: const Color(0xffEF8262),
              textColor: Colors.white,
              radius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)
              ),
              onPressed: ()async{
                launchLink( context, bookModel.volumeInfo.previewLink);
              },
            ),
          ),
        ],
      ),
    );
  }

}
