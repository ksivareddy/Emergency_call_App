import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURLBrowser() async {
  const url = 'https://youtu.be/33fVFazP2jc';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class AccidentScreen extends StatelessWidget {
  static const routeName = '/accident-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF081F53),
      appBar: AppBar(
        backgroundColor: Color(0xFF5b86e5),
        automaticallyImplyLeading: false,
        title: Text("Accident Screen"),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: (){
           Navigator.pop(context);
        }),
      ),
      body: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 70),
              SlimyCard(
                color: Color(0xFF5b86e5),
                topCardWidget: topCardWidget((snapshot.data)
                    ? 'assets/images/medicalvan.png'
                    : 'assets/images/DOC_hero.png'),
                bottomCardWidget: bottomCardWidget(),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget topCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Instructions',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Center(
          child: Text(
            'Incase of any Road Accident'
            '                                                                                '
                ' Click On the Medical Help',
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
      ElevatedButton.icon(
          icon: Icon(
            Icons.medical_services_outlined,
            color: Colors.white,
            size: 24.0,
          ),
          label: Text('Elevated Button'),
          onPressed: () {
            print('Pressed');
          },
          style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(16.0),
            ),
          ),
        ),
    
      ],
    );
  }

  Widget bottomCardWidget() {
    return Column(
      children: [
        Text(
          'Safety Tips',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Expanded(
          child:  ElevatedButton.icon(
          icon: Icon(
            Icons.video_library,
            color: Colors.white,
            size: 22.0,
          ),
          label: Text('click to see video'),
          onPressed: _launchURLBrowser, 
          style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ),
        ),
      ],
    );
  }
}