import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

part 'update_store.g.dart';

class UpdateStore = _UpdateStore with _$UpdateStore;

abstract class _UpdateStore with Store {

  @observable bool isLoading = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();


  Future<bool> apiUpdatePost(Post post) async {
    isLoading = true;
    String title = titleController.text.toString().trim();
    String content = contentController.text.toString().trim();

    post.title = title;
    post.body = content;

    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(),
        Network.paramsUpdate(post));

      isLoading = false;

      return response != null;


  }
}