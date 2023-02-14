import 'package:demo_app/model/jphPostsModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioExample extends StatelessWidget {
  const DioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Example'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: readData(),
        builder: (context, AsyncSnapshot<List<JphPostsModel>> snapshot) {
          if (snapshot.hasData) {
            final myPosts = snapshot.data!;
            return ListView.builder(
              itemCount: myPosts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(myPosts[index].title),
                    subtitle: Text(myPosts[index].body),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<JphPostsModel>> readData() async {
    Response response;
    final dio = Dio();
    response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    final myPosts = (response.data as List).map((e) => JphPostsModel.fromMap(e)).toList();
    return myPosts;
  }
}