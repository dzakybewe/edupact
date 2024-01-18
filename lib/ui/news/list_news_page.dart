import 'package:edupact/model/news.dart';
import 'package:edupact/widgets/custom_news_card.dart';
import 'package:flutter/material.dart';

import '../../firebase/database.dart';
import '../../widgets/custom_filter_chip.dart';
import '../../widgets/custom_header.dart';

class ListNewsPage extends StatefulWidget {
  const ListNewsPage({super.key});

  @override
  State<ListNewsPage> createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  List<String> cities = ['All', 'Jakarta', 'Bandung', 'Malang', 'Surabaya', 'Tangerang'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<News>>(
        future: Database().getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<News> newss = snapshot.data!;
            return Column(
              children: [
                const CustomHeader(title: 'News', hasSearchBar: true, hasBackButton: true,),
                const SizedBox(height: 25),
                CustomFilterChip(cities: cities),
                if (newss.isEmpty) const Expanded(
                  child: Center(
                    child: Text('No Data Available'),
                  ),
                ) else Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    itemCount: newss.length,
                    itemBuilder: (context, index) {
                      News news = newss[index];
                      return CustomNewsCard(news: news);
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
