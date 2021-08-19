import 'package:devopsui/utils/docker_screen.dart';
import 'package:devopsui/utils/kube_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animCtrl;
  late Animation<double> animation;

  late AnimationController animCtrl2;
  late Animation<double> animation2;

  bool showFirst = true;

  @override
  void initState() {
    super.initState();

    // Animation init
    animCtrl = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
    animation = CurvedAnimation(parent: animCtrl, curve: Curves.easeOut);
    animation.addListener(() {
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {});

    animCtrl2 = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation2 = CurvedAnimation(parent: animCtrl2, curve: Curves.easeOut);
    animation2.addListener(() {
      this.setState(() {});
    });
    animation2.addStatusListener((AnimationStatus status) {});
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Devops-ui",  style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.teal,

      ),

      body: Container(
      alignment: Alignment.center,
     decoration: BoxDecoration(
     image: DecorationImage(
     image: AssetImage('assets/e.jpg'),
     fit: BoxFit.cover,
     ),
     ),
    child:Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    const SizedBox(
    height: 245,
    ),
      // Card(
      //   semanticContainer: true,
      //   clipBehavior: Clip.antiAliasWithSaveLayer,
      //   // color: Colors.red,
      //   elevation: 20,
      //   child: Image.asset(
      //     'assets/button.png',
      //     fit: BoxFit.cover,
      //   ),
      //   shape: RoundedRectangleBorder(
      //     // side: BorderSide(color: Colors.white70, width: 1),
      //     borderRadius: BorderRadius.circular(40),
      //   ),
      // ),
    // ignore: avoid_unnecessary_containers
      Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.tealAccent,
        elevation: 6,
        child: MaterialButton(
          padding: EdgeInsets.all(15),


          child: const Text(
            'Docker',
            style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500, letterSpacing: 1.2),
          ),
          onPressed: () => docker(),

          minWidth: 200,
          height: 60,

        ), ),
      SizedBox(
        height: 126,
      ),
      Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.tealAccent,
        elevation: 5,
        child: MaterialButton(
          padding: EdgeInsets.all(15),


          child: const Text(
            'Kubernetes',
            style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500, letterSpacing: 1.2),
          ),
          onPressed: () => kube(),

          minWidth: 200,
          height: 60,

        ), ),


    ], ),

    ));
  }

  docker() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
      return DockerScreen();}),);
  }

  kube() {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) {
        return KubernetesScreen();}),);
  }

}
