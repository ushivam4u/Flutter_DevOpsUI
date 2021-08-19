import 'package:devopsui/utils/kube_output.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class KubernetesScreen extends StatefulWidget {
  static String kube_out = " ";

  @override
  _KubernetesScreenState createState() => _KubernetesScreenState();
}

class _KubernetesScreenState extends State<KubernetesScreen>{
  var command =" ";
  @override
  void initState() {
  super.initState();
  }

  myToast(mymsg, color) {
  Fluttertoast.showToast(
  msg: mymsg,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 2,
  backgroundColor: color,
  textColor: Colors.white,
  webPosition: "center",
  fontSize: 16.0);
  }

  perform() async {
  print(command);
  myToast('Please Wait...', Colors.blue);
  // setState(() {
  //   loading = true;
  // });
  var url = Uri.http("15.206.188.107", '/cgi-bin/docker.py?x="$command"');
  var urlf = Uri.parse('http://15.206.188.107/cgi-bin/kube.py?x=$command');
  var r1 = await http.get(urlf,  headers: {
  "Accept": "application/json",
  "Access-Control_Allow_Origin": "*"
  });
  print(r1.body);
  print(r1.statusCode);
  KubernetesScreen.kube_out = r1.body;
  navigate();


  }

  @override
  Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop: (){
      moveback;
      return Future.value(true);
    },
    child: Scaffold(
    appBar: AppBar(
    title: const Text("Kubernetes"),
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context),),
      backgroundColor: Colors.teal,
    // ignore: prefer_const_literals_to_create_immutables
       ),

    body: Container(
    alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/kuber.png'),
          fit: BoxFit.cover,
        ),
      ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Container(
      width: 300,
    child: TextField(
    cursorColor: Colors.teal,
    onChanged: (value) {
    command = value;
    },
    decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.teal.shade600),
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.white),
    ),
    filled: true,
    hintText: "Enter the Kubernetes command",
    border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.teal),
    borderRadius: BorderRadius.circular(10),
    )),
    )),
    SizedBox(
    height: 30,
    ),
    Material(
    borderRadius: BorderRadius.circular(20),
    color: Colors.teal,
    elevation: 5,
    child: MaterialButton(
    child: Text(
    'Go',
    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400, letterSpacing: 1.2),
    ),
    onPressed: perform,
    minWidth: 130,
    height: 40,
    ),
    ),
    ],
    ),
    ),
    ),
    );
  }

  void navigate() {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) {
        return KubeOutput();}),);
  }
  moveback()  {
    context:context;
    Navigator.pop(context, true);
  }

  }


