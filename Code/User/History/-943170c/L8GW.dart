import 'package:flutter/material.dart';
import './local_json.dart';
import './faker_data_operations.dart';
import './dio_example.dart';

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
          myCardListTileWidget(
            color: Colors.deepOrange.shade300,
            icon: const Icon(Icons.home, color: Colors.white, size: 40),
            title: 'Local JSON',
            subTitle: 'Read Local JSON File',
            route: MaterialPageRoute(builder: (context) => const LocalJSONPage()),
          ),
          myCardListTileWidget(
            color: Colors.teal.shade300,
            icon: const Icon(Icons.casino_rounded, color: Colors.white, size: 40),
            title: 'Faker Data Operations',
            subTitle: 'Read faker-js Data',
            route: MaterialPageRoute(builder: (context) => const FakerDataMain()),
          ),
          myCardListTileWidget(
            color: Colors.blue.shade300,
            icon: const Icon(Icons.cloud, color: Colors.white, size: 40),
            title: 'Dio Example',
            subTitle: 'Read Data from API',
            // route: MaterialPageRoute(builder: (context) => const DioExample()),
            route: MaterialPageRoute(builder: (context) => DioExample()),
          ),
        ],
      ),
    );
  }
}

class myCardListTileWidget extends StatelessWidget {
  const myCardListTileWidget({
    Key? key,
    required Color color,
    required Icon icon,
    required String title,
    required String subTitle,
    required Route route,
  })  : _color = color,
        _icon = icon,
        _title = title,
        _subTitle = subTitle,
        _route = route,
        super(key: key);

  final Color _color;
  final Icon _icon;
  final String _title;
  final String _subTitle;
  final Route _route;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _color,
      child: ListTile(
        leading: _icon,
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
              _title,
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
              _subTitle,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(_route);
          // Navigator.push(
          //   context,
          //   _route,
          // );
        },
      ),
    );
  }
}
