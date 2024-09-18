import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destiny());

class Destiny extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}



class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey[300]!, Colors.pink[900]!, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              if (storyBrain.getChoice1().isNotEmpty)
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      //Choice 1 made by user.
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.purple[700],
                    ),
                    child: Text(
                      storyBrain.getChoice1(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: 30,
              ),
              if (storyBrain.getChoice2().isNotEmpty)
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
