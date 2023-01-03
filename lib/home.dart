import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tugas_8/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final localStorage = LocalStorage('biodata');

  late String name;
  late String gender;
  late String address;
  late String hobby;

  @override
  void initState() {
    name = localStorage.getItem('name') ?? '-';
    gender = localStorage.getItem('gender') ?? '-';
    address = localStorage.getItem('address') ?? '-';
    hobby = localStorage.getItem('hobby') ?? '-';
    super.initState();
  }
//Muhammad fadli Hidayatullah 20104088
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/about');
          }, icon: const Icon(MdiIcons.account))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //Muhammad Fadli Hidayatullah 20104088
                    children: [
                      Text(
                        "Nama : $name",
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Alamat : $address",
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Hobi : $hobby",
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        "Jenis Kelamin : $gender",
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/biodata'),
        tooltip: 'About',
        child: const Icon(MdiIcons.pencil),
      ),
    );
  }
}
//Muhammad fadli Hidayatullah 20104088