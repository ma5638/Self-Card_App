// import 'package:system_alert_window/system_alert_window.dart';
import 'package:flutter/material.dart';
import 'package:self_therapy/globals.dart';

class QuotesList extends StatefulWidget {
  const QuotesList({Key? key}) : super(key: key);

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  @override
  Widget build(BuildContext context) {
    List<String> quoteList = App.quoteService.getQuotes();
    int numberQuotes = quoteList.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Quotes"),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: (){
              Navigator.pushNamed(context, '/showQuotes');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: numberQuotes,
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quoteList[i],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        App.quoteService.removeQuote(i);
                      });
                    },
                    icon: const Icon(
                      Icons.highlight_remove,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // function to add to quotes
          print(numberQuotes);
          Navigator.pushNamed(context, "/addQuote").then((_) => setState(() {}));
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
