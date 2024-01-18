import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edupact/common/styles.dart';
import 'package:edupact/firebase/auth.dart';
import 'package:edupact/firebase/database.dart';
import 'package:edupact/ui/workshop/detail_workshop_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'assets/images/header_background.png',
                width: double.maxFinite,
                fit: BoxFit.fill,
              ),
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const SizedBox(height: 100),
          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: Database().getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                Map<String, dynamic>? data = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      data['username'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      data['email'].toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: primaryColor
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                surfaceTintColor: Colors.white,
                                title: const Center(
                                  child: Text(
                                    'Sure you want to leave?',
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
                                        label: 'No, cancel',
                                        bgColor: Colors.white,
                                        onTap: () => Navigator.pop(context),
                                      ),
                                      CustomDialogButton(
                                        textColor: Colors.white,
                                        label: 'Yes, Leave',
                                        bgColor: Colors.red,
                                        onTap: () {
                                          Auth().signOut(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.exit_to_app),
                      label: const Text('Sign Out'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.white,
                      ),
                    ),

                  ],
                );
              } else {
                return const Text('No Data');
              }
            },

          )
        ],
      )
    );
  }
}
