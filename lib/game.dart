import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  var _imageApp = AssetImage("images/padrao.png");
  var _message = "Choose an option below";

  void _selectedOption(String userChoice){

    var options = ["rock", "paper", "scissors"];
    var number = Random().nextInt(options.length);
    var appChoice = options[number];

    switch(appChoice) {
      case "rock" :
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "paper" :
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
      case "scissors" :
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if(
        (userChoice == "rock" && appChoice == "scissors") ||
        (userChoice == "scissors" && appChoice == "paper") ||
        (userChoice == "paper" && appChoice == "rock")
    ){
      setState(() {
        this._message = "Congratulations!! You Won :)";
      });
    } else if (
        (appChoice == "rock" && userChoice == "scissors") ||
        (appChoice == "scissors" && userChoice == "paper") ||
        (appChoice == "paper" && userChoice == "rock")
    ) {
      setState(() {
        this._message = "You Lost :(";
      });
    } else {
      setState(() {
        this._message = "Tied ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 120, bottom: 16),
            child: Text(
              "Choice of App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imageApp,),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 32),
            child: Text(
              this._message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectedOption("rock"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedOption("paper"),
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _selectedOption("scissors"),
                child: Image.asset("images/tesoura.png", height: 100,),
              )
            ],
          )
        ],
      ),
    );
  }
}
