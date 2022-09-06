import 'package:flutter/material.dart';
import 'package:self_therapy/globals.dart';


class AddQuote extends StatefulWidget {
  const AddQuote({Key? key}) : super(key: key);

  @override
  State<AddQuote> createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {

  String quoteText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Quote"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                // color: const Color(0xFF100F0F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                // keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: null,
                onChanged: (String input) {
                  quoteText = input;
                  print(quoteText);
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Quote Text",
                  hintStyle: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () async {
                  App.quoteService.addQuote(quoteText);
                  setState(() {

                  });
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  alignment: Alignment.bottomCenter,
                ),
                child: const Text(
                  "Add Quote",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
