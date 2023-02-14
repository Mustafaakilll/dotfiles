import 'package:demo_app/dio_example.dart';
import 'package:demo_app/faker_data_operations.dart';
import 'package:demo_app/local_json.dart';
import 'package:flutter/material.dart';

class DataOperationsPage extends StatelessWidget {
  const DataOperationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Operations'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          MyCardListTileWidget(
            color: Colors.deepOrange.shade300,
            icon: const Icon(Icons.home, color: Colors.white, size: 40),
            title: 'Local JSON',
            subTitle: 'Read Local JSON File',
            route: MaterialPageRoute(
              builder: (context) => const LocalJSONPage(),
            ),
          ),
          MyCardListTileWidget(
            color: Colors.teal.shade300,
            icon: const Icon(
              Icons.casino_rounded,
              color: Colors.white,
              size: 40,
            ),
            title: 'Faker Data Operations',
            subTitle: 'Read faker-js Data',
            route: MaterialPageRoute(
              builder: (context) => const FakerDataMain(),
            ),
          ),
          MyCardListTileWidget(
            color: Colors.blue.shade300,
            icon: const Icon(Icons.cloud, color: Colors.white, size: 40),
            title: 'Dio Example',
            subTitle: 'Read Data from API',
            // route: MaterialPageRoute(builder: (context) => const DioExample()),
            route: MaterialPageRoute(builder: (context) => const DioExample()),
          ),
        ],
      ),
    );
  }
}

class MyCardListTileWidget extends StatelessWidget {
  const MyCardListTileWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.route,
  });

  final Color color;
  final Icon icon;
  final String title;
  final String subTitle;
  final Route route;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        leading: icon,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        subtitle: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(bottom: 5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(route);
          // Navigator.push(
          //   context,
          //   _route,
          // );
        },
      ),
    );
  }
}
