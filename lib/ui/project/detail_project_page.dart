import 'package:edupact/firebase/database.dart';
import 'package:flutter/material.dart';

import '../../model/project.dart';
import '../../widgets/custom_button.dart';

class DetailProjectPage extends StatelessWidget {
  final Project project;
  const DetailProjectPage({super.key, required this.project});

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
                  project.title,
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
                    tag: project.imageUrl,
                    child: Image.network(
                      project.imageUrl,
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
                      project.organizer,
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
                      project.date,
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
                      project.location,
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
                project.description,
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
                    '${project.registeredParticipants}/${project.maxParticipants}',
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
                    project.title,
                    project.description,
                    project.date,
                    project.organizer,
                    project.location,
                    project.imageUrl,
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
