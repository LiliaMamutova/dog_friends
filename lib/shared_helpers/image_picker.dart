import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPicker extends StatefulWidget {
  String? imageUrl;

  PhotoPicker({
    super.key,
    required this.onPickImage,
    this.imageUrl = "",
  });

  final void Function(File pickedImage) onPickImage;

  @override
  State<PhotoPicker> createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.imageUrl);
    final strings = AppLocalizations.of(context)!;
    final imageUrlExists =
        widget.imageUrl != null && widget.imageUrl!.isNotEmpty;
    final image = imageUrlExists ? NetworkImage(widget.imageUrl!) : null;
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          foregroundImage: _pickedImageFile != null && !imageUrlExists
              ? FileImage(_pickedImageFile!)
              : null,
          backgroundImage: image,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text(strings.photoPickerIconAddImage),
        ),
      ],
    );
  }
}
