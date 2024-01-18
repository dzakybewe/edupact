import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edupact/model/activity.dart';
import 'package:edupact/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import '../../firebase/database.dart';
import '../../widgets/custom_list_card.dart';

class ListActivityPage extends StatelessWidget {
  const ListActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: Database().getAllActivityWithIdsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<DocumentSnapshot> activityDocs = snapshot.data!.docs;
            List<Activity> activities = activityDocs.map((doc) {
              Activity activity = Activity.fromMap(doc.data() as Map<String, dynamic>);
              return activity;
            }).toList();

            return Column(
              children: [
                const CustomHeader(title: 'Your Activity'),
                const SizedBox(height: 25),
                if (activities.isEmpty) const Expanded(
                  child: Center(
                    child: Text('You haven\'t join any activity'),
                  ),
                ) else Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      Activity activity = activities[index];
                      String docId = activityDocs[index].id;
                      return CustomListCard.activity(activity: activity, docId: docId);
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Text('No Data');
          }
        },
      ),
    );
  }
}
