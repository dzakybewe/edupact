import 'package:edupact/firebase/database.dart';
import 'package:edupact/widgets/custom_list_card.dart';
import 'package:flutter/material.dart';
import '../../model/project.dart';
import '../../widgets/custom_filter_chip.dart';
import '../../widgets/custom_header.dart';

class ListProjectPage extends StatefulWidget {
  const ListProjectPage({super.key});

  @override
  State<ListProjectPage> createState() => _ListProjectPageState();
}

class _ListProjectPageState extends State<ListProjectPage> {
  List<String> cities = ['All', 'Jakarta', 'Bandung', 'Malang', 'Surabaya', 'Tangerang'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Project>>(
        future: Database().getAllProjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<Project> projects = snapshot.data!;
            return Column(
              children: [
                const CustomHeader(title: 'Project', hasSearchBar: true,),
                const SizedBox(height: 25),
                CustomFilterChip(cities: cities),
                if (projects.isEmpty) const Expanded(
                  child: Center(
                    child: Text('No Project Available'),
                  ),
                ) else Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      Project project = projects[index];
                      return CustomListCard.project(project: project);
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




