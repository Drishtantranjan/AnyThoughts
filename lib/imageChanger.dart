import 'package:flutter/material.dart';


class ChangeImage extends StatefulWidget {
  const ChangeImage({super.key, required this.sender});
  final String sender;

  @override
  State<ChangeImage> createState() => _ChangeImageState();
}

class _ChangeImageState extends State<ChangeImage> {
 String _setImage() {
 

  if(widget.sender == ".") {
    return "assets/Screenshot_from_2023-01-19_00-39-21-removebg-preview.png";
  } else{
    return "assets/Screenshot_from_2023-01-19_00-39-33-removebg-preview.png";
  } 

 // works
}

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(_setImage()),
    );
  }
}