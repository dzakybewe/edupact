import 'package:edupact/model/workshop.dart';
import 'package:flutter/material.dart';
import '../../firebase/database.dart';
import '../../widgets/custom_filter_chip.dart';
import '../../widgets/custom_list_card.dart';
import '../../widgets/custom_header.dart';

class ListWorkshopPage extends StatefulWidget {
  const ListWorkshopPage({super.key});

  @override
  State<ListWorkshopPage> createState() => _ListWorkshopPageState();
}

class _ListWorkshopPageState extends State<ListWorkshopPage> {
  List<String> cities = ['All', 'Jakarta', 'Bandung', 'Malang', 'Surabaya', 'Tangerang'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Workshop>>(
        future: Database().getAllWorkshops(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<Workshop> workshops = snapshot.data!;
            return Column(
              children: [
                const CustomHeader(title: 'Workshop', hasSearchBar: true, hasBackButton: true,),
                const SizedBox(height: 25),
                CustomFilterChip(cities: cities),
                if (workshops.isEmpty) const Expanded(
                  child: Center(
                    child: Text('No Workshop Available'),
                  ),
                ) else Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    itemCount: workshops.length,
                    itemBuilder: (context, index) {
                      Workshop workshop = workshops[index];
                      return CustomListCard.workshop(workshop: workshop);
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

