import 'package:edupact/widgets/support_widgets.dart';
import 'package:flutter/material.dart';

import '../model/news.dart';

class CustomNewsCard extends StatelessWidget {
  final News news;
  const CustomNewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => snackBarFeatureNotAvailable(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: SizedBox(
          height: 200,
          child: Card(
              elevation: 2.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 66,
                    fit: FlexFit.loose,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                      child: Hero(
                        tag: news.imageUrl,
                        child: Image.network(news.imageUrl, fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 33,
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
