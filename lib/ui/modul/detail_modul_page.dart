import 'package:edupact/model/modul.dart';
import 'package:edupact/widgets/support_widgets.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class DetailModulPage extends StatelessWidget {
  final Modul modul;
  const DetailModulPage({super.key, required this.modul});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 33,
                    child: Container(
                      height: 200,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Hero(
                          tag: modul.imageUrl,
                          child: Image.network(
                            modul.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 66,
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          modul.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Category : ${modul.category}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Date : ${modul.date}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Size : ${modul.size}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Views : ${modul.views}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                textAlign: TextAlign.start,
              ),
              Text(
                modul.description,
                style:
                const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                maxLines: 8,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: 'Read',
                onPressed: () => snackBarFeatureNotAvailable(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
