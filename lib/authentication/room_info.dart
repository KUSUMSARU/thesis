import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rentomatic_app/global/global.dart';
import 'package:rentomatic_app/splashScreen/splash_screen.dart';

class RoomInfoScreen extends StatefulWidget {
  RoomInfoScreen({Key? key}) : super(key: key);

  @override
  State<RoomInfoScreen> createState() => _RoomInfoScreenState();
}

class _RoomInfoScreenState extends State<RoomInfoScreen> {
  TextEditingController ownertextEditingController = TextEditingController();
  TextEditingController addresstextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
  TextEditingController roomtypetextEditingController = TextEditingController();

  List<String> roomTypeList = ["Room", "Apartment", "House"];
  String? selectedroomtype;

  saveRoomInfo() {
    Map ownerRoomInfoMap = {
      "owner_name": ownertextEditingController.text.trim(),
      "Address": addresstextEditingController.text.trim(),
      "phone ": phonetextEditingController.text.trim(),
      "Houseinfo": roomtypetextEditingController.text.trim(),
      "type": selectedroomtype,
    };
    DatabaseReference ownerRef = FirebaseDatabase.instance.ref().child("owner");
    ownerRef
        .child(currentFirebaseUser!.uid)
        .child("room_info")
        .set(ownerRoomInfoMap);
    Fluttertoast.showToast(msg: "Room detail has been save,congralution");
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => MySplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset("assets/image.jpg"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Room and Apartment detail",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: ownertextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "Room/Apartment Address",
                  hintText: "Address",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              TextField(
                controller: addresstextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "address",
                  hintText: "address",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              TextField(
                controller: phonetextEditingController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "PhoneNumber",
                  hintText: "number",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              TextField(
                controller: roomtypetextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "RoomType",
                  hintText: "RoomType",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButton(
                iconSize: 20,
                dropdownColor: Colors.black,
                hint: const Text(
                  "Please choose room type",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                value: selectedroomtype,
                onChanged: (newValue) {
                  setState(() {
                    selectedroomtype = newValue.toString();
                  });
                },
                items: roomTypeList.map((room) {
                  return DropdownMenuItem(
                    child: Text(
                      room,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    value: room,
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (ownertextEditingController.text.isNotEmpty &&
                      addresstextEditingController.text.isNotEmpty &&
                      phonetextEditingController.text.isNotEmpty &&
                      roomtypetextEditingController.text.isNotEmpty &&
                      selectedroomtype != null) {
                    saveRoomInfo();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text(
                  "Save Now",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
