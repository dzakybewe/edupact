import 'package:edupact/model/workshop.dart';
import 'package:flutter/material.dart';

import '../../firebase/database.dart';
import '../../widgets/custom_button.dart';

class DetailWorkshopPage extends StatelessWidget {
  final Workshop workshop;
  const DetailWorkshopPage({super.key, required this.workshop});

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
              Center(
                child: Text(
                  workshop.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.maxFinite,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Hero(
                    tag: workshop.imageUrl,
                    child: Image.network(
                      workshop.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Organizer :',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      workshop.organizer,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date :',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      workshop.date,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Location :',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      workshop.location,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                textAlign: TextAlign.start,
              ),
              Text(
                workshop.description,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                maxLines: 8,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Participants',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '${workshop.registeredParticipants}/${workshop.maxParticipants}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: 'Join',
                onPressed: () {
                  Database().addActivity(
                      workshop.title,
                      workshop.description,
                      workshop.date,
                      workshop.organizer,
                      workshop.location,
                      workshop.imageUrl,
                      context
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialogButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String label;
  final void Function() onTap;

  const CustomDialogButton({
    super.key,
    required this.bgColor,
    required this.textColor,
    required this.label,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: bgColor,
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
