import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  @observable bool isLoading = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future<bool> apiCreatePost() async{
    isLoading = true;
    String title = titleController.text.toString().trim();
    String content = contentController.text.toString().trim();

    Post post =  Post(id: 101, title: title, body: content, userId: 101);

    var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    isLoading = false;

    return response != null;


  }

}