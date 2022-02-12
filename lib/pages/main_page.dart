import 'package:flutter/material.dart';

import '../animation/fade_animation.dart';

class PartyUI extends StatefulWidget {
  static const String id = "party_page";

  const PartyUI({Key? key}) : super(key: key);

  @override
  _PartyUIState createState() => _PartyUIState();
}

class _PartyUIState extends State<PartyUI> with SingleTickerProviderStateMixin {
  String _buttonText = "Start";
  Color _buttonColor = const Color(0xffe68538);
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 0));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img.png'),
                  fit: BoxFit.cover
              )
          ),
          child: FadeAnimation(1, FadeTransition(
            opacity: _animation,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08,
                  vertical: MediaQuery.of(context).size.height * 0.08),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                      ])),
              child: FadeAnimation(
                  1.1,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Find the best\nparties near you.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Let us find you a party for your\ninterest",
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 24,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      MaterialButton(
                        height: MediaQuery.of(context).size.height * 0.05,
                        minWidth: MediaQuery.of(context).size.width * 0.8, 
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        color: _buttonColor,
                        child: Text(
                          _buttonText,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            _buttonColor = const Color(0xffe15241);
                            _buttonText = "Google+";
                          });
                        }
                      )
                    ],
                  )),
            ),
          ),)



      ),
    );
  }
}