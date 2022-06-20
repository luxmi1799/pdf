import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> litems_name = ["item1","item2","item3","item4","item5","item6","item7","item8","item9","item10"];
  List<String> litems_price = ["100","140","500","200","400","360","480","620","90","45"];
  List<String> litems_description = ["This is 1 item","This is 2 item","This is 3 item","This is 4 item","This is 5 item","This is 6 item","This is 7 item","This is 8 item","This is 9 item","This is 10 item"];

  List<int> _counter = [];
  int total =0;
  int sub_total = 0;
  double grand_total = 0;
  int discount = 15;
  double gst = 0;
 // List<int> totallist = [];

  Map<int,dynamic> map_map = Map();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo application"),
      ),
      body: signature(context),
    );
  }

  Widget signature(BuildContext context){
    return SingleChildScrollView(
       child: Column(
         children: [
           ListView.builder(
             scrollDirection: Axis.vertical,
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: litems_name.length,
                   itemBuilder: (BuildContext context, int index) {
                     if(_counter.length < litems_name.length){
                       _counter.add(0);
                     }
                     return Card(
                       child: Container(
                         margin: EdgeInsets.all(10),
                         padding: EdgeInsets.all(15),
                         alignment: Alignment.centerLeft,
                         child: Column(
                           children: [
                             Text(litems_name[index],
                               style: TextStyle(
                                 fontSize: 18,
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                               ),
                              ),

                            SizedBox(
                              height: 5,
                            ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Text(
                                //_counter[index] <= 0?"₹" + litems_price[index]:"₹"+map_map[index],
                                //  "₹" + litems_price[index] ,
                                 "₹" + litems_price[index] ,
                                 style: TextStyle(
                                   fontSize: 16,
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),


                               Container(
                                 height: 35,
                                 width: 100,
                                 decoration: BoxDecoration(
                                   border: Border.all(
                                     color: Colors.black,
                                   ),
                                   borderRadius: BorderRadius.circular(6.0),
                                 ),
                                 child: Center(
                                   child: IntrinsicHeight(
                                     child: Row(
                                       children: [
                                         InkWell(
                                             onTap:(){
                                               _decrementCounter(index);
                                             },
                                             child: Icon(Icons.remove)),

                                         VerticalDivider(
                                           color: Colors.grey,
                                           thickness: 2,
                                         ),
                                         Text(
                                           _counter[index].toString(),
                                         ),
                                         VerticalDivider(
                                           color: Colors.grey,
                                           thickness: 2,
                                         ),
                                         InkWell(
                                             onTap:(){
                                               _incrementCounter(index);
                                             },
                                             child: Icon(Icons.add)),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             ],

                           ),

                             SizedBox(
                               height: 5,
                             ),

                             Container(
                               alignment: Alignment.centerLeft,
                               color: Colors.grey[200],
                               child: ExpansionTile(
                                 title: Text(" Items Details",
                                   textScaleFactor: 1.2,
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 16,
                                     color: Colors.grey[500],
                                   ),),
                                 trailing: Icon(
                                   Icons.arrow_drop_down,color: Colors.grey[500],
                                   // _customTileExpanded
                                   //     ? Icons.arrow_drop_down_circle
                                   //     : Icons.arrow_drop_down,
                                 ),
                                 children:  <Widget>[

                                   Text(litems_description[index],
                                     style: TextStyle(color: Colors.black),
                                   ),

                                 ],
                                 onExpansionChanged: (bool expanded) {
                                 },
                               ),
                             ),


                           ],
                         )
                       ),
                     );
                   }),

               Padding(
             padding: const EdgeInsets.all(10.0),
             child: Card(

               child:Table(
                  // Allows to add a border decoration around your table
                   children: [

                     TableRow(children :[
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Text('Sub Total',style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                         ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Text('$sub_total',
                           style: TextStyle(
                             fontSize: 16,
                           ),),
                       ),
                     ]),

                     TableRow(children :[
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Text('Discount',style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                         ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Text('0% Off',
                           style: TextStyle(
                             fontSize: 16,
                             color: Colors.green
                           ),),
                       ),
                     ]),

                     TableRow(children :[
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Text('Taxes And Charges',style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                         ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Text('$gst',
                           style: TextStyle(
                             fontSize: 16,
                           ),),
                       ),
                     ]),

                     TableRow(children :[
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Text('Total Amount',style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                         ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Text('$grand_total',
                           style: TextStyle(
                             fontSize: 16,
                           ),),
                       ),
                     ]),
                   ]
               ),
             ),
           ),
               RaisedButton(
               onPressed: (){
                 _createPDF();
               },
               child: Text("Generate",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 22,
                   fontWeight: FontWeight.bold,
                   backgroundColor:  Colors.amber,
                 ),),
               color: Colors.amber),
             ],
       ),
    );
  }

  _incrementCounter(int i) {
    setState(() {
      _counter[i]++;
      total = _counter[i] * int.parse(litems_price[i]);
      map_map[i] = total;
      print("not containss$map_map");
      print("totalc$total");
      var values = map_map.values;
      var result = values.reduce((sum, element) => sum + element);
      sub_total = result;
      double gst_a = result * 0.18 ;
      grand_total = gst_a +result;
      gst = gst_a;
      print("grand_total$grand_total");
      print("gst$gst_a");
    });
  }


  _decrementCounter(int i) {
    setState(() {
      if (_counter[i] <= 0) {
        _counter[i] = 0;
      } else {
        _counter[i]--;
        total = _counter[i] * int.parse(litems_price[i]);
        map_map[i] = total;
        print("containss$map_map");
        print("total2$total");
        var values = map_map.values;
        var result = values.reduce((sum, element) => sum + element);
        sub_total = result;

        double gst_a = result * 0.18 ;
        gst = gst_a;
        grand_total = gst_a +result;


        print("grand_total$grand_total");
        print("gst$gst_a");
      }
    });
   // _event.add(_counter[i]);
  }

  Future<void> _createPDF() async {
    //Create a PDF document.
    var document = PdfDocument();
    //Add page and draw text to the page.

    document.pages.add().graphics.drawString(
        'Invoice', PdfStandardFont(PdfFontFamily.helvetica, 18),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(0, 0, 500, 30));

    document.pages.add().graphics.drawString(
        'Total Amount $grand_total', PdfStandardFont(PdfFontFamily.helvetica, 18),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(0, 0, 500, 30));

    //Save the document
    var bytes = document.save();
    // Dispose the document
    document.dispose();

    Directory directory = await getApplicationDocumentsDirectory();
//Get directory path
    String path = directory.path;
//Create an empty file to write PDF data
    File file = File('$path/Output.pdf');
//Write PDF data
    await file.writeAsBytes(bytes, flush: true);
//Open the PDF document in mobile
    OpenFile.open('$path/Output.pdf');
  }
}
