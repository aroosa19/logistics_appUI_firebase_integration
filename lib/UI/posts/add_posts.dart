import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_integration/Utils/Utils.dart';
import 'package:firebase_integration/reuseable_widgets/round_button.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final postController = TextEditingController();
  bool loading = false;
  //created an instance and reference to the database, created a node here
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        backgroundColor: const Color(0xff001B43),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 5,
              controller: postController,
              decoration: const InputDecoration(
                hintText: "What's in your mind?",
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Add Post',
                loading: loading,
                onTap: (){
              setState(() {
                loading = true;
              });

              String id = DateTime.now().millisecondsSinceEpoch.toString();
              //this will store/post data into your firebase
              //remember that child id and data id must be same
              databaseRef.child(id).set({
                // 'id' : 1
                //data is stored in the form of key value pair
               'title': postController.text.toString(),
                'id' : id
              }).then((value) {
                Utils().toastMessage('Post Added');
                setState(() {
                  loading = false;
                });
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
                setState(() {
                  loading = false;
                });
              });
            })
          ],
        ),
      ),
    );
  }

}
