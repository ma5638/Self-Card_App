import 'package:self_therapy/globals.dart';
import "dart:math";

List<String> defaultQuotes = ["It is okay to fall", "It is okay not to know", "You are fine"];

class QuoteService extends Object {
  final _random = Random();
  List<String> quoteList = [];
  int currQuote = -1;
  List<String> categories = [];
  QuoteService() {
    quoteList =
        App.localStorage.getStringList("quoteList") ?? [];
    if (quoteList.isEmpty){
      quoteList = defaultQuotes;
    }
  }

  // Asynchronous
  void saveQuotes(){
    App.localStorage.setStringList("quoteList", quoteList);
  }

  void addQuote(String quote){
    quoteList.add(quote);
    saveQuotes();
  }
  void removeQuote(int index){
    quoteList.removeAt(index);
    saveQuotes();
  }
  List<String> getQuotes(){
    return quoteList;
  }

  String getNextQuote(){
    if (quoteList.isEmpty){
      // print("No quotes");
      return "You are fine";
    } else if (quoteList.length == 1){
      currQuote = 0;
      return quoteList[currQuote];
    } // else

    // Math Trick to find index of quote that is not current quote
    int currQuoteTemp = _random.nextInt(quoteList.length-1);
    if (currQuoteTemp >= currQuote){
      currQuote = currQuoteTemp + 1;
    } else {
      currQuote = currQuoteTemp;
    }
    // print("GNQ: $currQuote");

    return quoteList[currQuote];
  }

}