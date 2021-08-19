import 'package:devopsui/utils/kube_screen.dart';
import 'package:flutter/material.dart';

class KubeOutput extends StatefulWidget {
  @override
  _KubeOutputState createState() => _KubeOutputState();
}

class _KubeOutputState extends State<KubeOutput> {
  var output;

  @override
  void initState() {
    output = KubernetesScreen.kube_out;
    // TODO: implement initState
    super.initState();
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
          title: Text('Output'),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context),),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal ,
            child: Container(
                margin: EdgeInsets.all(20),
                // color: Colors.grey,

                child: Text(
                  output,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
        ),
      ),
    );
  }
  moveback()  {
    context:context;
    Navigator.pop(context, true);
  }
}