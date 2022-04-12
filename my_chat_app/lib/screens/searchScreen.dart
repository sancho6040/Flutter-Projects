import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/shared/database_helper.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = new TextEditingController();
  DatabaseHelper db = DatabaseHelper();
  late QuerySnapshot searchSnapshot;

  search() {
    db.getUserByUsername(searchController.text).then((val) {
      // print("val" + val.toString());
      setState(() {
        searchSnapshot = val;
        print("docs" + searchSnapshot.docs.toString());
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return const SerachRes(
                username: "name",
                // username: searchSnapshot.docs[index].data["name"],
                email: "email",
              );
            })
        : Container();
  }

  @override
  void initState() {
    search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("buscar"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Buscar...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      search();
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SerachRes extends StatelessWidget {
  final String? username;
  final String? email;
  const SerachRes({Key? key, this.username, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username!),
              Text(email!),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: const Text("Mensaje"),
          )
        ],
      ),
    );
  }
}
