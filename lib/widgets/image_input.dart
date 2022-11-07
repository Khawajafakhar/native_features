import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;

class ImageInput extends StatefulWidget {
  final Function onSelectedimage;
   // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
   ImageInput(this.onSelectedimage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _uploadImage() async{
    final _picker = ImagePicker();
    final _imageFile =await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(_imageFile==null){
      return;
    }
    setState(() {
      _storedImage=File(_imageFile.path);
    });
    final appDir=await sysPath.getApplicationDocumentsDirectory();
    final fileName= path.basename('${File(_imageFile.path)}');
   final savedImage= await File(_imageFile.path).copy('${appDir.path}/$fileName');
   widget.onSelectedimage(savedImage);

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'Upload Image',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton.icon(
                onPressed: _uploadImage,
                icon: const Icon(Icons.camera),
                label: const Text('Upload Image')))
      ],
    );
  }
}
