import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edupact/common/styles.dart';
import 'package:edupact/firebase/database.dart';
import 'package:edupact/ui/modul/list_modul_page.dart';
import 'package:edupact/ui/news/list_news_page.dart';
import 'package:edupact/ui/workshop/list_workshop_page.dart';
import 'package:edupact/widgets/support_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_nav_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: Database().getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data!.data() as Map<String, dynamic>;
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Hi, ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: user['username'].toString(),
                              style: const TextStyle(
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Let’s contribute to our world.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 18.0),

                      /* Tiles Section */
                      Flexible(
                        fit: FlexFit.loose,
                        child: GridView.count(
                          physics: const ScrollPhysics(
                          ),
                          shrinkWrap: true,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          crossAxisCount: 4,
                          childAspectRatio: 4/5,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ListWorkshopPage())),
                              child: const CustomNavTile(
                                text: 'Workshop',
                                icon: Icons.accessibility,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ListModulPage())),
                              child: const CustomNavTile(
                                text: 'Modul',
                                icon: Icons.menu_book,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ListNewsPage())),
                              child: const CustomNavTile(
                                text: 'News',
                                icon: Icons.newspaper,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                snackBarFeatureNotAvailable(context);
                              },
                              child: const CustomNavTile(
                                text: 'Shop',
                                icon: Icons.shopping_cart,
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* End of Tiles Section */

                      const SizedBox(height: 18.0),

                      /* SDGs Videos Section */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Watch SDGs Videos',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          GestureDetector(
                            onTap: () => snackBarFeatureNotAvailable(context),
                            child: const Text(
                              'Show more',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0,),
                      GestureDetector(
                        onTap: () => snackBarFeatureNotAvailable(context),
                        child: SizedBox(
                          height: 220,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 66,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                                    child: Image.network(
                                      'https://i.ytimg.com/vi/o08ykAqLOxk/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDYqx6OaCQ3IFB2RCWzMC2oSvRkKw',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'How We Can Make the World a Better Place by 2030 | Michael Green | TED Talks',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      /* End of SDGs Videos Section */

                      const SizedBox(height: 18.0),

                      /* News Section */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => snackBarFeatureNotAvailable(context),
                            child: const Text(
                              'News',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => snackBarFeatureNotAvailable(context),
                            child: const Text(
                              'Show more',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0,),
                      GestureDetector(
                        onTap: () => snackBarFeatureNotAvailable(context),
                        child: SizedBox(
                          height: 220,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 66,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                                    child: Image.network(
                                      'https://i.ytimg.com/vi/o08ykAqLOxk/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDYqx6OaCQ3IFB2RCWzMC2oSvRkKw',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'How We Can Make the World a Better Place by 2030 | Michael Green | TED Talks',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text('No Data');
          }
        },

      ),
    );
  }
}


