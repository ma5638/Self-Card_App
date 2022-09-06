import 'package:flutter/material.dart';
import 'package:self_therapy/globals.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ShowQuotes extends StatefulWidget {
  const ShowQuotes({Key? key}) : super(key: key);

  @override
  State<ShowQuotes> createState() => _ShowQuotesState();
}

class _ShowQuotesState extends State<ShowQuotes> {

  String quoteCurrent = App.quoteService.getNextQuote();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Quotes"),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(10.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child:  GestureDetector(
            onTap: (){
              // print("GD: Tap");

              setState((){
                quoteCurrent = App.quoteService.getNextQuote();
                // print("GD: $quoteCurrent");
              });
            },
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage("images/forest_calm.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4),
                          BlendMode.darken),
                    ),
                  ),
                  child: Center(
                    child: AnimatedTextKit(
                      key: ValueKey<String>(quoteCurrent),
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText(quoteCurrent,
                            textAlign: TextAlign.center,
                            textStyle: const TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                            speed: const Duration(milliseconds: 100)
                      ),
                      ],
                    )
                    // Text(
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
