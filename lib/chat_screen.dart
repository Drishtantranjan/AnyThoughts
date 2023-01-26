import 'dart:async';
import 'package:chat_gpt_integration/homepage.dart';
import 'package:chat_gpt_integration/speech_to_text.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'chatmessage.dart';
import 'threedots.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  ChatGPT? chatGPT;

  StreamSubscription? _subscription;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    chatGPT = ChatGPT.instance;
  }
  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
  // Link for api - https://beta.openai.com/account/api-keys
  void _sendMessage() {
    ChatMessage message = ChatMessage(text: _controller.text, sender: ".");

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();

    final request = CompleteReq(
        prompt: message.text, model: kTranslateModelV3, max_tokens: 200);

   
    _subscription = chatGPT!
        .builder("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",
            orgId: "")
        .onCompleteStream(request: request)
        .listen((response) {
      Vx.log(response!.choices[0].text);
      ChatMessage botMessage =
          ChatMessage(text: response.choices[0].text, sender: "..");

      setState(() {
        _isTyping = false;
        _messages.insert(0, botMessage);
      });
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
        
              child: SizedBox(
                  
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  controller: _controller,
                  onSubmitted: (value) => _sendMessage(),
                  decoration:
                       InputDecoration.collapsed(hintText: "Ask me anything",hintStyle: GoogleFonts.poppins(
                        color: Colors.blueGrey
                       )),
                ),
              ),
            ),
          
      ],
    );
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c202a),
        appBar: AppBar(
          elevation: 0.0,
          actions: [
           
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: CircleAvatar(
              radius: 30.0,
             backgroundColor: Colors.transparent,
             
              backgroundImage: AssetImage('assets/Screenshot_from_2023-01-19_00-39-33-removebg-preview.png'),
             ),
           )
          ],
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(onPressed: ((){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );
            }) ,child: const Icon(Icons.chevron_left_rounded,color: Colors.white,),
            shape: CircleBorder(),
            padding: EdgeInsets.all(0.2),
          color: const Color(0xff272c39),),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title:  Column(
            children: [
              Text("AnyThoughts?",
              style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold
              ),),
              Row(
                   mainAxisAlignment: MainAxisAlignment.center ,
                children: [
               
                  Text("👋",style: TextStyle(
                    
                    color: Colors.white,
                    fontSize: 13.0
                  ),),
                   Text("Say hey to start",style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0
                  ),).shimmer(
                 primaryColor: Vx.purple300, secondaryColor: Colors.white
              ),
                ],
              ),
             
            ],
          )),
          body: Padding(
            padding: const EdgeInsets.only(bottom:10.0,left: 0.0),
            child: SafeArea(
            child: Column(
             
                children: [
                Flexible(
                
                    child: ListView.builder(
                  reverse: true,
                  padding: Vx.m8,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _messages[index];
                  },
                )),
                if (_isTyping) const ThreeDots(),
                const Divider(
                  height: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                     width: 270,
                     padding: EdgeInsets.only(left: 20,right: 15.0,top: 12,bottom: 12),

                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff272c39),
                      ),
                      child: _buildTextComposer(),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: MaterialButton(
                    color:const Color(0xff7269e3),
                    child: const Icon(Icons.send_rounded,color: Colors.white,),
                   onPressed: () => _sendMessage(),
                   padding: EdgeInsets.all(8.0),
                   shape: CircleBorder(),
                    ),
                      ),
                  ]
               ).px16()
                 
              ],
            ),
        ),
          ));
  }
}
