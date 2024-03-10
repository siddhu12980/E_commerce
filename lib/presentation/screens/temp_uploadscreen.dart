import 'dart:typed_data';
import 'package:e_com/bloc/user_provider.dart';
import 'package:e_com/data/models/user_model.dart';
import 'package:e_com/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => UploadScreenState();
}

class UploadScreenState extends State<UploadScreen> {
  // final TextEditingController _descriptionController = TextEditingController();

  // Uint8List? _image;

  // void selectiamge() async {
  //   Uint8List img = await pickimage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }

  // void postimage(
  //   String uid,
  //   String username,
  //   String profileimage,
  // ) async {
  //   try {} catch (e) {}
  // }

  // _selectImage(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return SimpleDialog(
  //           title: const Text("Create a Post"),
  //           children: [
  //             SimpleDialogOption(
  //               child: const Text("Take a Photo"),
  //               onPressed: () async {
  //                 Navigator.of(context).pop();
  //                 Uint8List file = await pickimage(
  //                   ImageSource.camera,
  //                 );

  //                 setState(() {
  //                   _image = file;
  //                 });
  //               },
  //             ),
  //             SimpleDialogOption(
  //               child: const Text("Choose a Photo"),
  //               onPressed: () async {
  //                 Navigator.of(context).pop();
  //                 Uint8List file = await pickimage(
  //                   ImageSource.gallery,
  //                 );

  //                 setState(() {
  //                   _image = file;
  //                 });
  //               },
  //             ),
  //             SimpleDialogOption(
  //                 child: const Text(" Cancel "),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 }),
  //           ],
  //         );
  //       });
  // }

  Uint8List? _image = null;
  final picker = ImagePicker();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  Future getImage() async {
    Uint8List img = await pickimage(ImageSource.gallery);

    setState(() {
      if (img != null) {
        _image = img;
      } else {
        print('No image selected.');
      }
    });
  }

  void _upload() {
    // Upload image to Firebase Storage
    // Save  details to Firestore or Realtime Database
    // Here you can implement the Firebase upload logic
    print("updating firebase");
    clear();
  }

  void clear() {
    _titleController.clear();
    _descriptionController.clear();
    _priceController.clear();

    // Optionally, you can also reset the image
    if (_image != null) {
      setState(() {
        _image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _image == null
                ? Center(child: Text('No image selected.'))
                : Container(
                    child: Image.memory(_image!),
                  ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: getImage,
                child: Text('Select Image'),
              ),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: ' Title',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: ' Description',
              ),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.numberWithOptions(signed: false),
              decoration: InputDecoration(
                labelText: ' Price',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _upload,
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}


//Scaffold(
     
           