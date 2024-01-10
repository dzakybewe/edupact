import 'package:edupact/common/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_nav_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Hi, ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Prima!',
                        style: TextStyle(
                          color: secondaryColor,
                        )
                      )
                    ]
                  )
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
                SizedBox(
                  height: 215,
                  child: GridView.count(
                    physics: const ScrollPhysics(
                    ),
                    shrinkWrap: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 4,
                    childAspectRatio: 4/5,
                    children: const [
                      CustomNavTile(
                        text: 'Workshop',
                        icon: Icons.accessibility,
                      ),
                      CustomNavTile(
                        text: 'Modul',
                        icon: Icons.menu_book,
                      ),
                      CustomNavTile(
                        text: 'News',
                        icon: Icons.newspaper,
                      ),
                      CustomNavTile(
                        text: 'Shop',
                        icon: Icons.shopping_cart,
                      ),
                      CustomNavTile(
                        text: 'Project',
                        icon: Icons.work,
                      ),
                      CustomNavTile(
                        text: 'More',
                        icon: Icons.more_horiz,
                      ),
                    ],
                  ),
                ),
                /* End of Tiles Section */

                const SizedBox(height: 18.0),

                /* SDGs Videos Section */
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Watch SDGs Videos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      'Show more',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),
                SizedBox(
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
                /* End of SDGs Videos Section */

                const SizedBox(height: 18.0),

                /* News Section */
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      'Show more',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),
                SizedBox(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


