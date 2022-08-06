import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:patterns_mobx_architecture5/model/post_model.dart';
import 'package:patterns_mobx_architecture5/pages/home_page.dart';
import 'package:patterns_mobx_architecture5/service/http_service.dart';
import 'package:patterns_mobx_architecture5/stores/create_store.dart';
class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  static const String id = "create_post";

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  CreateStore store = CreateStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post", style: TextStyle(color: Colors.white, fontSize: 28),),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300
                      ),
                      child: TextField(
                        controller: store.titleController,
                        decoration: InputDecoration(
                            hintText: "Title",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300
                      ),
                      child: TextField(
                        controller: store.contentController,
                        decoration: InputDecoration(
                            hintText: "Content",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue
                      ),
                      child: Center(
                          child: GestureDetector(
                            onTap: (){
                              store.apiCreatePost().then((value) => {
                                if(value) Navigator.pop(context),
                              });
                            },
                            child: Text("Add Post", style: TextStyle(color: Colors.white, fontSize: 22),),
                          )
                      ),
                    ),

                  ],
                ),
              ),
            ),
            store.isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : SizedBox.shrink(),
          ],
        ),
      )
    );
  }
}
