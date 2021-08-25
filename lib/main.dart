import 'package:date_convert/drawer.dart';
import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:date_format/date_format.dart';

void main(List<String> args) {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.teal[100],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.orange,
            title: Text("Nepali Date Converter"),
          ),
          drawer: drawer(),
          body: arebhai())));
}

class arebhai extends StatefulWidget {
  @override
  _arebhaiState createState() => _arebhaiState();
}

class _arebhaiState extends State<arebhai> {
  TextEditingController yearcontroller = new TextEditingController();
  TextEditingController monthcontroller = new TextEditingController();
  TextEditingController daycontroller = new TextEditingController();
  int getyear = 2020;
  int getmonth = 10;
  int getday = 12;

  var nt;
  var dt;
  String plz = " ";
  //String plzz = "Hii";

  void time() {
    setState(() {
      getyear = int.parse(yearcontroller.text);
      getmonth = int.parse(monthcontroller.text);
      getday = int.parse(daycontroller.text);
      if (getyear >= 1913 &&
          getyear <= 2040 &&
          getmonth <= 12 &&
          getday <= 32) {
        var nt = DateTime(getyear, getmonth, getday).toNepaliDateTime();
        var date1 = NepaliDateFormat.yMEd();
        var last = date1.format(nt);

        //var nt = DateTime(2019,01,27).toNepaliDateTime();
        plz = last.toString();
        // plz = "hii";
        print('In BS = $nt');
        //var dt = nt.toDateTime();
        //plzz=dt.toString();
        // print('In AD = $dt');
        // getyear =int.parse( yearcontroller.text);
        // getmonth = monthcontroller.text;
        // getday = daycontroller.text;

      } else {
        plz = "Out Of Range";
      }
      yearcontroller.clear();
      monthcontroller.clear();
      daycontroller.clear();
    });
  }

  void timeEn() {
    setState(() {
      getyear = int.parse(yearcontroller.text);
      getmonth = int.parse(monthcontroller.text);
      getday = int.parse(daycontroller.text);
      if (getyear >= 1969 &&
          getyear <= 2100 &&
          getmonth <= 12 &&
          getday <= 32) {
        // var nt = DateTime(getyear, getmonth, getday).toNepaliDateTime();
        var nt = NepaliDateTime(getyear, getmonth, getday).toDateTime();
        var date1 = formatDate(nt, [yyyy, '-', mm, '-', dd]);
        // var last= date1.format(nt);
        //var nt = DateTime(2019,01,27).toNepaliDateTime();
        plz = date1.toString();
        // plz = "hii";
        // print('In BS = $nt');
        // var dt = nt.toNepaliDateTime();
        // plz=dt.toString();
        // print('In AD = $dt');
        // getyear =int.parse( yearcontroller.text);
        // getmonth = monthcontroller.text;
        // getday = daycontroller.text;
      } else {
        plz = "Out Of Range";
      }
      yearcontroller.clear();
      monthcontroller.clear();
      daycontroller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: Column(children: [
        //    Text(plz),
        //   // Text(dt),
        //   FlatButton(onPressed: time, child: Text("Press")),
        // ],)
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          // SizedBox(height: 40.0),

          TextField(
            controller: yearcontroller,
            decoration: InputDecoration(
              hintText: "Year",
              hintStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            maxLength: 4,
          ),
          // SizedBox(height: 40.0),
          TextField(
            controller: monthcontroller,
            decoration: InputDecoration(
              hintText: "Month",
              hintStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            maxLength: 2,
          ),
          // SizedBox(height: 40.0),
          TextField(
            controller: daycontroller,
            decoration: InputDecoration(
              hintText: "Day",
              hintStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            maxLength: 2,
          ),
          SizedBox(height: 30),
          SizedBox(
            width: 400,
            child: MaterialButton(
              onPressed: timeEn,
              child: Text(
                "From BS to AD",
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.red,
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: 400,
            child: MaterialButton(
              onPressed: time,
              child: Text(
                "From AD to BS",
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.green[500],
            ),
          ),
          // Text('$getyear'),
          // Text(getmonth),
          // Text(getday),
          SizedBox(height: 20),
          Text(
            plz,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
  }
}
