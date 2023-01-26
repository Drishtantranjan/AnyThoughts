import 'dart:ui';

import 'package:chat_gpt_integration/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:velocity_x/velocity_x.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Color(0xff1c202a),
      appBar: AppBar(
        backgroundColor: Color(0xff1c202a),

        
      ),
      body: Stack
      (
        children:<Widget>[ Container(
       
          
        decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/James & Katie (4).png"), 
            fit: BoxFit.cover),
        ),
        ),
        Align(
          alignment: Alignment(0.0,0.6),
          child: Text("AnyThoughts?",
          
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.white
          ),).shimmer(
                 primaryColor: Vx.purple200, secondaryColor: Colors.white,
              ),
            
        ),
        Padding(
          padding: const EdgeInsets.only(top:550,left: 30,right: 30),
          child: SlideAction(
            text: "       Slide to connect with AI",
            textStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              
            ),
            borderRadius: 25,
            innerColor: Colors.deepPurple,
            outerColor: Colors.deepPurple[200],
           sliderRotate: false,
            sliderButtonIcon: Icon(Icons.arrow_forward_ios_outlined,
            
            color: Colors.white,),
            onSubmit: () {
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ChatScreen()),
  );
            },
          ),
        )
        
        ]
      ),
    );
  }
}