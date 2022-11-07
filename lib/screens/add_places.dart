import 'package:flutter/material.dart';
import '../providers/great_place.dart';
import '../widgets/image_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class AddPlaces extends StatefulWidget {
  const AddPlaces({Key? key}) : super(key: key);
  static const routeName = 'add-places';

  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final TextEditingController? _titleController = TextEditingController();
  File? _selectedImage;

  void _selectedFile(File selectedImage){
  _selectedImage=selectedImage;
  }
   void _onSaved(){
    if(_titleController==null || _selectedImage==null){
      return;
    }
   Provider.of<GreatPlaces>(context,listen: false).addPlace(_titleController!.text, _selectedImage!);
   Navigator.of(context).pop();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Places'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      label: Text('Enter Title'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   ImageInput(_selectedFile),
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: _onSaved,
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
            style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          ),
        ],
      ),
    );
  }
}
