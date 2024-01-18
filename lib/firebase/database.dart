import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edupact/firebase/auth.dart';
import 'package:edupact/model/modul.dart';
import 'package:edupact/model/news.dart';
import 'package:edupact/model/project.dart';
import 'package:edupact/model/workshop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../common/styles.dart';
import '../ui/workshop/detail_workshop_page.dart';

class Database {
  final db = FirebaseFirestore.instance;
  User? currentUser = Auth().currentUser;

  Future<void> addNewUserToDb(
      UserCredential? userCredential, String username) async {
    if (userCredential != null && userCredential.user != null) {
      await db.collection("users").doc(userCredential.user!.email).set({
        "email": userCredential.user!.email,
        "username": username,
      });
    }
  }

  Future<void> addProject(
    String title,
    String description,
    String date,
    String organizer,
    String location,
    int registeredParticipants,
    int maxParticipants,
    String imageUrl,
  ) async {
    await db.collection("projects").doc().set({
      "title": title,
      "description": description,
      "date": date,
      "organizer": organizer,
      "location": location,
      "registeredParticipants": registeredParticipants,
      "maxParticipants": maxParticipants,
      "imageUrl": imageUrl,
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    return await db.collection("users").doc(currentUser!.email).get();
  }

  Future<List<Project>> getAllProjects() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("projects").get();
    return querySnapshot.docs.map((doc) {
      return Project(
        title: doc['title'],
        description: doc['description'],
        date: doc['date'],
        organizer: doc['organizer'],
        location: doc['location'],
        registeredParticipants: doc['registeredParticipants'],
        maxParticipants: doc['maxParticipants'],
        imageUrl: doc['imageUrl'],
      );
    }).toList();
  }

  Future<List<Workshop>> getAllWorkshops() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("workshops").get();
    return querySnapshot.docs.map((doc) {
      return Workshop(
        title: doc['title'],
        description: doc['description'],
        date: doc['date'],
        organizer: doc['organizer'],
        location: doc['location'],
        registeredParticipants: doc['registeredParticipants'],
        maxParticipants: doc['maxParticipants'],
        imageUrl: doc['imageUrl'],
      );
    }).toList();
  }

  Future<List<Modul>> getAllModul() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("moduls").get();
    return querySnapshot.docs.map((doc) {
      return Modul(
          title: doc['title'],
          writer: doc['writer'],
          description: doc['description'],
          date: doc['date'],
          category: doc['category'],
          size: doc['size'],
          views: doc['views'],
          imageUrl: doc['imageUrl']);
    }).toList();
  }

  Future<List<News>> getAllNews() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("news").get();
    return querySnapshot.docs.map((doc) {
      return News(
          title: doc['title'],
          writer: doc['writer'],
          description: doc['description'],
          date: doc['date'],
          webUrl: doc['webUrl'],
          imageUrl: doc['imageUrl']);
    }).toList();
  }

  Future<void> addActivity(
      String title,
      String description,
      String date,
      String organizer,
      String location,
      String imageUrl,
      BuildContext context) async {
    final activityData = {
      'title': title,
      'description': description,
      'date': date,
      'organizer': organizer,
      'location': location,
      'imageUrl': imageUrl,
    };

    final usersCollectionRef = db.collection('users');
    final userEmailDocRef = usersCollectionRef.doc(currentUser!.email);
    final querySnapshot = await userEmailDocRef
        .collection('user_activity')
        .where('title', isEqualTo: title)
        .where('description', isEqualTo: description)
        .where('organizer', isEqualTo: organizer)
        .get();

    if (querySnapshot.docs.isEmpty) {
      // No activity with the same title found, add a new activity
      final newActivityRef = userEmailDocRef.collection('user_activity').doc();

      if (context.mounted) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                surfaceTintColor: Colors.white,
                title: const Center(
                  child: Text(
                    'Sure you want to join?',
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
                        label: 'No, Cancel',
                        bgColor: Colors.white,
                        onTap: () => Navigator.pop(context),
                      ),
                      CustomDialogButton(
                        textColor: Colors.white,
                        label: 'Yes, Confirm',
                        bgColor: primaryColor,
                        onTap: () async {
                          await newActivityRef.set(activityData);
                          if (context.mounted) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    surfaceTintColor: Colors.white,
                                    title: const Center(
                                      child: Text(
                                        'Successfully Joined!',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      CustomDialogButton(
                                          bgColor: primaryColor,
                                          textColor: Colors.white,
                                          label: 'Done',
                                          onTap: (){
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                      )
                                    ],
                                    actionsAlignment: MainAxisAlignment.center,
                                  );
                                });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            });
      }
    } else {
      // Activity with the same title already exists, handle accordingly
      const snackBar = SnackBar(
        content: Center(child: Text('You already registered to this activity')),
        behavior: SnackBarBehavior.floating,
      );
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Stream<QuerySnapshot> getAllActivityWithIdsStream() {
    return db
        .collection('users')
        .doc(currentUser!.email)
        .collection('user_activity')
        .snapshots();
  }

  Future<void> deleteActivity(BuildContext context, String docId) async {
    await db
        .collection('users')
        .doc(currentUser!.email)
        .collection('user_activity')
        .doc(docId)
        .delete();
    if (context.mounted) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
}
