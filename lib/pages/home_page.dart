import 'package:flutter/material.dart';
import 'package:patterns_mobx_architecture5/pages/create_post.dart';
import 'package:patterns_mobx_architecture5/stores/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../views/item_of_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeStore store = HomeStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mob X",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder:(_) => Stack(
          children: [
            ListView.builder(
              itemCount: store.items.length,
              itemBuilder: (ctx, index) {
                return itemOfPost(store,store.items[index]);
              },
            ),
            store.isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : SizedBox.shrink(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreatePost.id);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }


}
