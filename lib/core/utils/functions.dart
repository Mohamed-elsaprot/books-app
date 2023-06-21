import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../features/home/data/models/BookModel.dart';

Future<void> launchLink( BuildContext ctx, String? url)async{
  if(url!=null){
    Uri uri =Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }else {
      customSnackBar(ctx,'  can\'t launch the link');
    }
  }
}

void customSnackBar(BuildContext ctx,String text){
  ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
          backgroundColor:Colors.red,
          content: Row(
            children:[
              const Icon(Icons.error_outline),
              Text('  $text',style: const TextStyle(color: Colors.white),),
            ],
          ))
  );
}

getText(BookModel bookModel){
  if(bookModel.volumeInfo.previewLink==null){
    return 'Not Available';
  }else {
    return 'preview';
  }

}
