import 'package:api_works/services/remote_service.dart';
import "package:flutter/material.dart";

import '../model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async{
    posts = await RemoteService().getPosts();
    if (posts != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text('${posts![index].contacts} ${posts![index].pubDate}'),
            );
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
