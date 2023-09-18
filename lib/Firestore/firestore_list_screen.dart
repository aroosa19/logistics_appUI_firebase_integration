// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_integration/Firestore/add_firestore_data.dart';
// import 'package:firebase_integration/UI/auth/login_screen.dart';
// import 'package:firebase_integration/Utils/Utils.dart';
// import 'package:flutter/material.dart';

// class FirestoreScreen extends StatefulWidget {
//   const FirestoreScreen({super.key});

//   @override
//   State<FirestoreScreen> createState() => _FirestoreScreenState();
// }

// class _FirestoreScreenState extends State<FirestoreScreen> {
//   @override
//   final auth = FirebaseAuth.instance;
//   final editController = TextEditingController();
//   final firestore = FirebaseFirestore.instance.collection('users').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('users');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: const Text("Firestore Screen"),
//         backgroundColor: const Color(0xff001B43),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 auth.signOut().then((value) {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const LoginScreen()));
//                 }).onError((error, stackTrace) {
//                   Utils().toastMessage(error.toString());
//                 });
//               },
//               icon: const Icon(Icons.logout_sharp)),
//           const SizedBox(
//             width: 10,
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           StreamBuilder<QuerySnapshot>(
//               stream: firestore,
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if(snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 }
//                 if(snapshot.hasError){
//                   return const Text('Some error has occurred!');
//                 }
//                 return Expanded(
//                   child: ListView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           onTap: (){
//                             //updating data in Firestore
//                             // ref.doc(snapshot.data!.docs[index]['id'].toString()).update({
//                             //   'title' : 'Started working today'
//                             // }).then((value) {
//                             //   Utils().toastMessage('Updated');
//                             // }).onError((error, stackTrace) {
//                             //   Utils().toastMessage(error.toString());
//                             // });
//                             //Deleting data from firestore
//                             ref.doc(snapshot.data!.docs[index]['id'].toString()).delete();
//                           },
//                           title: Text(snapshot.data!.docs[index]['title'].toString()),
//                           subtitle: Text(snapshot.data!.docs[index]['id'].toString()),
//                         );
//                       }),
//                 );
//               }),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Navigator.push(context,
//           //     MaterialPageRoute(builder: (context) => const AddPostScreen()));
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const AddFirestoreData()));
//         },
//         backgroundColor: const Color(0xff001B43),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   //Creating the alert box for editing and deleting
//   Future<void> showMyDialog(String title, String id) async {
//     editController.text = title;
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text('Update'),
//             content: Container(
//               child: TextField(
//                 controller: editController,
//                 decoration: const InputDecoration(hintText: 'Edit'),
//               ),
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     'Cancel',
//                     style: TextStyle(color: Color(0xff001B43)),
//                   )),
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     'Update',
//                     style: TextStyle(color: Color(0xff001B43)),
//                   )),
//             ],
//           );
//         });
//   }
// }
