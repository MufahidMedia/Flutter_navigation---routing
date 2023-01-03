import 'package:flutter/material.dart';
import 'package:tugas_8/home.dart';
import 'package:localstorage/localstorage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({Key? key}) : super(key: key);

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {

  final localStorage = LocalStorage('biodata');

  final form = GlobalKey<FormState>();

  late String name;
  late String gender;
  late String address;
  late String hobby;

  @override
  void initState() {
    name = localStorage.getItem('name') ?? '';
    gender = localStorage.getItem('gender') ?? '';
    address = localStorage.getItem('address') ?? '';
    hobby = localStorage.getItem('hobby') ?? '';
    super.initState();
  }
//Muhammad Fadli Hidayatullah 20104088
  void saveForm() {
    final isValid = form.currentState?.validate();

    if (isValid == false) return;

    localStorage.setItem('name', name);
    localStorage.setItem('gender', gender);
    localStorage.setItem('address', address);
    localStorage.setItem('hobby', hobby);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biodata"), centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    initialValue: localStorage.getItem('name'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(MdiIcons.account),
                      hintText: "Nama",
                    ),
                    validator: (value) => value?.isEmpty == true ? 'Nama tidak boleh kosong' : null,
                    onChanged: (value) => setState(() {
                      name = value;
                    }),
                  ),
                ),
                //Muhammad Fadli Hidayatullah 20104088
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    initialValue: localStorage.getItem('gender'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(MdiIcons.genderMaleFemale),
                      hintText: "Jenis Kelamin"
                    ),
                    onChanged: (value) => setState(() {
                      gender = value;
                    }),
                    validator: (value) => value?.isEmpty == true ? 'Jenis kelamin tidak boleh kosong' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    initialValue: localStorage.getItem('address'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(MdiIcons.mapMarker),
                      hintText: "Alamat"),
                    onChanged: (value) => setState(() {
                      address = value;
                    }),
                    validator: (value) => value?.isEmpty == true ? 'Alamat tidak boleh kosong' : null,
                  ),
                ),
                //Muhammad Fadli Hidayatullah 20104088
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    initialValue: localStorage.getItem('hobby'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(MdiIcons.accountHeart),
                      hintText: "Hobi"),
                    onChanged: (value) => setState(() {
                      hobby = value;
                    }),
                    validator: (value) => value?.isEmpty == true ? 'Hobi tidak boleh kosong' : null,
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      saveForm();
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(fontSize: 16),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  } 
}
//Muhammad Fadli Hidayatullah 20104088