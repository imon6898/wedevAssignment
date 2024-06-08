import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CircularImagePicker extends StatefulWidget {
  final String? imagePath;
  final String fallbackImagePath;
  final double width;
  final double height;

  const CircularImagePicker({
    Key? key,
    this.imagePath,
    required this.fallbackImagePath,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _CircularImagePickerState createState() => _CircularImagePickerState();
}

class _CircularImagePickerState extends State<CircularImagePicker> {
  String? _selectedImagePath;

  @override
  void initState() {
    super.initState();
    _selectedImagePath = widget.imagePath;
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _selectedImagePath = pickedFile.path;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  void _showImageSourceActionSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFFFFFF),
                offset: Offset(0, 3),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipOval(
            child: _selectedImagePath != null
                ? Image.file(
              File(_selectedImagePath!),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // If image fails to load, show fallback image
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(
                    widget.fallbackImagePath,
                    width: 18,
                    height: 18,
                  ),
                );
              },
            )
                : Image.asset(
              widget.fallbackImagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/svg/camera.svg',
                width: 13,
                height: 10,
              ),
              onPressed: _showImageSourceActionSheet,
            ),
          ),
        ),
      ],
    );
  }
}
