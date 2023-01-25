import 'dart:io';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/string.dart';
import 'editprofile_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? originalImage;
  File? compressedImag;
  String compressedImagePath = "/storage/emulated/0/Download/";
  bool isMale = true;

  //image pick from gallery ====>
  Future pickImage() async {
    final pickedFile =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        originalImage = File(pickedFile.path);
      });
    }

    if (originalImage == null) return null;
    final compressedFile = await FlutterImageCompress.compressAndGetFile(
        originalImage!.path, "$compressedImagePath/file1.jpg");
    if (compressedFile != null) {
      setState(() {
        compressedImag = compressedFile;
      });
      print(await originalImage!.length());
      print(await compressedFile.length());
    }
  }

//picked image from gallery, compressed image ====>
  Future compressImage() async {
    if (originalImage == null) return null;
    final compressedFile = await FlutterImageCompress.compressAndGetFile(
        originalImage!.path, "$compressedImagePath/file1.jpg",
        quality: 10);
    if (compressedFile != null) {
      setState(() {
        compressedImag = compressedFile;
      });
      print(await originalImage!.length());
      print(await compressedFile.length());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //titleTextStyle:const TextStyle(fontSize: 14),
        toolbarHeight: 28,
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 14),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 17,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image - user image
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 110,
                  width: 110,
                  child: Stack(children: [
                    originalImage != null
                        ? CircleAvatar(
                            radius: 52,
                            backgroundColor: isMale ? Colors.blue : Colors.pink,
                            child: CircleAvatar(
                              radius: 50,
                              foregroundImage: FileImage(originalImage!),
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 50,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton(
                                  onPressed: pickImage,
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                  ]),
                ),
              ),

              const Divider(),
              DView.spaceHeight(),

              //text basic information
              const Text(
                AppString.basicInformation,
                style: TextStyle(
                    color: Appcolors.primaryColor, fontWeight: FontWeight.bold),
              ),
              DView.spaceHeight(),

              //text name
              const Text(
                AppString.name,
                style: TextStyle(color: Appcolors.primaryColor),
              ),
              DView.spaceHeight(),

              // text Edit field - name text field
              const EditProfileTextField(obscureText: false),
              DView.spaceHeight(),

              const Align(
                  alignment: Alignment.topRight,
                  child: Text(AppString.passwordhelper)),
              DView.spaceHeight(),

              //text password
              const Text(
                AppString.password,
                style: TextStyle(color: Appcolors.primaryColor),
              ),
              DView.spaceHeight(),

              // text Edit field - name text field
              const EditProfileTextField(obscureText: true),
              DView.spaceHeight(),
              //text conform password
              const Text(
                AppString.passConform,
                style: TextStyle(color: Appcolors.primaryColor),
              ),
              // text Edit field - name text field
              const EditProfileTextField(obscureText: true),
              DView.spaceHeight(),

              //elevated button - update profile
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Center(
                    child: Text(
                      "Update Profile",
                      style: TextStyle(color: Appcolors.scaffoldBGColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
