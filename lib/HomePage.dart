// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:api/apiservices.dart';
import 'package:api/models/Datamodel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PostModel>? posts;
  var isloaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    posts = await ResponseData().getPosts();

    if (posts != null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isloaded,
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  trailing: Text(posts![index].id.toString()),
                  title: Text(posts![index].title),
                  subtitle: Text(posts![index].body.toString()),
                  leading: Icon(Icons.data_object),
                ),
              );
            }),
        replacement: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
