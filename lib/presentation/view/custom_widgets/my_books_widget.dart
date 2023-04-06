import 'package:flutter/material.dart';

import '../../../utils/sizes.dart';

class MyBooksWidget extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  final String? author;
  final String? edition;
  final String? owner;
  final String? price;

  MyBooksWidget({this.title, this.author, this.imgUrl, this.edition,this.owner,this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            child: Image.network(
              imgUrl ?? 'https://picsum.photos/200',fit: BoxFit.cover,
              width: MySizes.scrY / 3,height: MySizes.scrX/7,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          Expanded(
            child: ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( "Title  : "),
                  Expanded(child: Text( author??"Title")),
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Author : "),
                    Expanded(child: Text( author??"Author")),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( "Edition: "),
                    Expanded(child: Text(edition ?? "Edition"),),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( "Owner  : "),
                    Expanded(child: Text(owner ?? "Owner"),),
                  ],
                ),

                  price!=""?
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( "price  : "),
                      Expanded(child: Text(price ?? "Price"),),
                    ],
                  ):Text( "Free"),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
