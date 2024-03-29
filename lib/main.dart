import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordpair = WordPair.random();

    return MaterialApp(
        title: 'ListTask',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RandomTasks());
  }
}

class RandomTaskState extends State<RandomTasks> {
  @override
  Widget build(BuildContext context) {
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18.0);

    _buildRow(WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    }

    _buildSuggestions() {
      return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();

            final index = i ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomTasks extends StatefulWidget {
  @override
  RandomTaskState createState() => RandomTaskState();
}
