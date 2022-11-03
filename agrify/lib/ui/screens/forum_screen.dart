import 'package:agrify/logic/controllers/auth_methods.dart';
import 'package:agrify/logic/controllers/firestore_methods.dart';
import 'package:agrify/ui/screens/individual_guide_screen.dart';
import 'package:agrify/ui/utilities/colors.dart';
import 'package:agrify/ui/utilities/constant.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForumScreen extends StatefulWidget {
  ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  bool isLoggedIn = AuthMethods().authState;

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  final _firestoreMethods = FirestoreMethods();

  final _authMethods = AuthMethods();

  bool isClicked = false;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarySwatch,
      floatingActionButton: isLoggedIn
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close,
                                        color: kPrimarySwatch),
                                  ),
                                ],
                              ),
                              spacer(height: 10),
                              const Text(
                                'Create Post',
                                style: TextStyle(fontSize: 18),
                              ),
                              spacer(height: 10),
                              TextInputField(
                                placeholder: 'Title',
                                borderColor: kPrimarySwatch,
                                controller: _titleController,
                              ),
                              spacer(height: 20),
                              TextField(
                                controller: _descriptionController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kPrimarySwatch,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kPrimarySwatch,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kPrimarySwatch,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    label: Text(
                                      'Description',
                                      style: TextStyle(color: kPrimarySwatch),
                                    )),
                                minLines: 1,
                                maxLines: 10,
                              ),
                              spacer(height: 30),
                              FilledButton(
                                color: kPrimarySwatch,
                                text: 'Post',
                                onTap: () async {
                                  setState(() {
                                    isClicked = !isClicked;
                                  });
                                  if (_titleController.text.isNotEmpty &&
                                      _descriptionController.text.isNotEmpty) {
                                    await _firestoreMethods.createPosts(
                                      uid: _authMethods.gerUserId,
                                      postTitle: _titleController.text,
                                      postDes: _descriptionController.text,
                                    );
                                    Navigator.of(context).pop();
                                    showSnackbar(
                                        'Successfully Posted', context);
                                  } else {
                                    Navigator.of(context).pop();
                                    showSnackbar(
                                        'Failed! Title or description is empty',
                                        context);
                                  }
                                  setState(() {
                                    isClicked = !isClicked;
                                  });
                                },
                                textColor: kWhiteColor,
                              ),
                              isClicked
                                  ? CircularProgressIndicator(
                                      color: kPrimarySwatch,
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const Icon(Icons.add),
              backgroundColor: kPrimarySwatch,
            )
          : SizedBox(),
      body: Column(
        children: [
          const Text(
            'Forum',
            style: TextStyle(fontSize: 20),
          ),
          const Text(
            'Ask and Answer Queries',
            style: TextStyle(fontSize: 16),
          ),
          spacer(height: 20),
          Expanded(
            child: StreamFetch(),
          ),
        ],
      ),
    );
  }
}

class StreamFetch extends StatelessWidget {
  const StreamFetch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: ((context, index) {
            var postSnap = snapshot.data!.docs[index];
            return Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        postSnap.get('author'),
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.MMMd().format(postSnap.get('date').toDate()),
                        style: TextStyle(color: kWhiteColor),
                      ),
                    ],
                  ),
                  spacer(height: 10),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title:
                              Text(postSnap.get('postTitle')),
                          subtitle: Text(
                            postSnap.get('postDes'),
                            style: TextStyle(color: kWhiteColor),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    IndividualGuideScreen(crop: 'Potato')),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            'replies'.toUpperCase(),
                            style: const TextStyle(color: kWhiteColor),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }));
        }
        return Container();
      },
    );
  }
}
