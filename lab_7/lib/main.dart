import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  void updateStory(int choice) {
    setState(() {
      storyBrain.nextStory(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // ✅ Màu nền màn hình
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient( // ✅ Gradient nền nếu muốn lung linh
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.black],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Lab 7: Boss Level Challenge 2 - Destini',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  storyBrain.getStory(),
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ),
            Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () => updateStory(1),
                child: Text(storyBrain.getChoice1()),
              ),
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () => updateStory(2),
                child: Text(storyBrain.getChoice2()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
