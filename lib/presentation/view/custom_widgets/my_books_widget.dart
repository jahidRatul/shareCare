import 'package:flutter/material.dart';

import '../../../utils/sizes.dart';

class MyBooksWidget extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  final String? author;
  final String? edition;

  MyBooksWidget({this.title, this.author, this.imgUrl, this.edition});

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
              title: Text(title ?? "Title"),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(author ?? "Author"),
                  Text(edition ?? "Edition"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
