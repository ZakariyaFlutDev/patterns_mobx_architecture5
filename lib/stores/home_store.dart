import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/post_model.dart';
import '../pages/update_post.dart';
import '../service/http_service.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable bool isLoading = false;
  @observable List<Post> items = [];

  void apiPostList() async {
    isLoading = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading = false;
    return response != null;
  }

  void apiPostUpdate(Post post, BuildContext context) {
    Navigator.of(context)
        .push( MaterialPageRoute(builder: (BuildContext context) {
      return UpdatePost(post: post);
    }));
  }


}