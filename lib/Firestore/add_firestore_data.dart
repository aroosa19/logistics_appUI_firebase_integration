import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_integration/Utils/Utils.dart';
import 'package:firebase_integration/reuseable_widgets/round_button.dart';
import 'package:flutter/material.dart';

class AddFirestoreData extends StatefulWidget {
  const AddFirestoreData({super.key});

  @override
  State<AddFirestoreData> createState() => _AddFirestoreDataState();
}

class _AddFirestoreDataState extends State<AddFirestoreData> {

  final postController = TextEditingController();
  bool loading = false;
  //created an instance and reference to the database, created a node here
  final firestore = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Firestore Data'),
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
                title: 'Add Data',
                loading: loading,
                onTap: (){
                  setState(() {
                    loading = true;
                  });
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  firestore.doc(id).set({
                    'title': postController.text.toString(),
                    'id' : id
                  }).then((value) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage('Data Added');
                  }).onError((error, stackTrace){
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }

}
