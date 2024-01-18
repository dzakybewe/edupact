import 'package:edupact/model/modul.dart';
import 'package:edupact/model/project.dart';
import 'package:edupact/model/workshop.dart';
import 'package:edupact/ui/activity/detail_activity_page.dart';
import 'package:edupact/ui/modul/detail_modul_page.dart';
import 'package:edupact/ui/workshop/detail_workshop_page.dart';
import 'package:edupact/widgets/support_widgets.dart';
import 'package:flutter/material.dart';

import '../common/styles.dart';
import '../model/activity.dart';
import '../ui/project/detail_project_page.dart';

class CustomListCard extends StatelessWidget {
  final Project? project;
  final Workshop? workshop;
  final Activity? activity;
  final Modul? modul;
  final String? docId;

  const CustomListCard.project({
    super.key,
    required this.project,
    this.workshop,
    this.activity,
    this.modul,
    this.docId,
  });

  const CustomListCard.workshop({
    super.key,
    required this.workshop,
    this.project,
    this.activity,
    this.modul,
    this.docId,
  });

  const CustomListCard.modul({
    super.key,
    required this.modul,
    this.project,
    this.workshop,
    this.activity,
    this.docId,
  });

  const CustomListCard.activity({
    super.key,
    required this.activity,
    this.project,
    this.workshop,
    this.modul,
    required this.docId,
  });



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (project != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProjectPage(project: project!)));
        } else if (workshop != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailWorkshopPage(workshop: workshop!)));
        } else if (modul != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailModulPage(modul: modul!)));
        } else if (activity != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailActivityPage(activity: activity!, docId: docId!)));
        } else {
          snackBarFeatureNotAvailable(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: SizedBox(
          height: 150,
          child: Card(
            color: primaryColor,
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 33,
                    child: Container(
                      width: 100,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Hero(
                          tag: project != null ? project!.imageUrl : workshop != null ? workshop!.imageUrl : activity != null ? activity!.imageUrl : modul != null ? modul!.imageUrl : '',
                          child: Image.network(
                            project != null ? project!.imageUrl : workshop != null ? workshop!.imageUrl : activity != null ? activity!.imageUrl : modul != null ? modul!.imageUrl : '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    flex: 66,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project != null ? project!.title : workshop != null ? workshop!.title : activity != null ? activity!.title : modul != null ? modul!.title : '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              project != null ? project!.organizer : workshop != null ? workshop!.organizer : activity != null ? activity!.organizer : modul != null ? modul!.writer : '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                project != null ? project!.date : workshop != null ? workshop!.date : activity != null ? activity!.date : modul != null ? modul!.date : '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: Colors.white60
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                project != null ? project!.location : workshop != null ? workshop!.location : activity != null ? activity!.location : '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  color: Colors.white60,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}