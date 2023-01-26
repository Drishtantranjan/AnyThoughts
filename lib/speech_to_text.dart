import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Speech_to_text extends StatefulWidget {
  const Speech_to_text({super.key});

  @override
  State<Speech_to_text> createState() => _Speech_to_textState();
}

class _Speech_to_textState extends State<Speech_to_text> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {  },
      child: Icon(Icons.mic_none_rounded,color: Colors.white
      ,) ,
      shape: CircleBorder(
              
      ),
      color: Color(0xff1c202a),
    );
  }
}