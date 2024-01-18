import 'package:edupact/model/modul.dart';
import 'package:flutter/material.dart';

import '../../firebase/database.dart';
import '../../widgets/custom_filter_chip.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/custom_list_card.dart';

class ListModulPage extends StatefulWidget {
  const ListModulPage({super.key});

  @override
  State<ListModulPage> createState() => _ListModulPageState();
}

class _ListModulPageState extends State<ListModulPage> {
  List<String> cities = ['All', 'Jakarta', 'Bandung', 'Malang', 'Surabaya', 'Tangerang'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Modul>>(
        future: Database().getAllModul(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<Modul> moduls = snapshot.data!;
            return Column(
              children: [
                const CustomHeader(title: 'Modul', hasSearchBar: true, hasBackButton: true,),
                const SizedBox(height: 25),
                CustomFilterChip(cities: cities),
                if (moduls.isEmpty) const Expanded(
                  child: Center(
                    child: Text('No Modul Available'),
                  ),
                ) else Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    itemCount: moduls.length,
                    itemBuilder: (context, index) {
                      Modul modul = moduls[index];
                      return CustomListCard.modul(modul: modul);
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
