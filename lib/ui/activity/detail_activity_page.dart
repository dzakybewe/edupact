import 'package:edupact/firebase/database.dart';
import 'package:edupact/model/activity.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../workshop/detail_workshop_page.dart';

class DetailActivityPage extends StatelessWidget {
  final String docId;
  final Activity activity;
  const DetailActivityPage({super.key, required this.activity, required this.docId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            onPressed: () => Navigator.pop(context)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  activity.title,
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Hero(
                    tag: activity.imageUrl,
                    child: Image.network(
                      activity.imageUrl,
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
                      activity.organizer,
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
                      activity.date,
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
                      activity.location,
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
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                activity.description,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ),
                maxLines: 8,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              CustomButton(
                label: 'Cancel',
                onPressed: (){
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          surfaceTintColor: Colors.white,
                          title: const Center(
                            child: Text(
                              'Sure you want to cancel?',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomDialogButton(
                                  textColor: Colors.black,
                                  label: 'No',
                                  bgColor: Colors.white,
                                  onTap: () => Navigator.pop(context),
                                ),
                                CustomDialogButton(
                                  textColor: Colors.white,
                                  label: 'Yes, Cancel',
                                  bgColor: Colors.red,
                                  onTap: () {
                                    Database().deleteActivity(context, docId);
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      });
                },
                isCancel: true,
              )

            ],
          ),
        ),
      ),
    );
  }
}
