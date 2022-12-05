import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV_PDF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: home(),
    );
  }
}

class home extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController experience = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('CV-PDF'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: address,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Address',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: contact,
                maxLines: null,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Contact',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: email,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: skills,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Skills',
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: experience,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Experience',
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(

              color: Colors.amber,
              onPressed: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext) => new Nextpage(
                        name: name.text,
                        address: address.text,
                        contact: contact.text ,
                        email: email.text,
                        skills : skills.text,
                        experience : experience.text
                    ),
                );
                Navigator.of(context).push(route);
              },
              child: Text(
                "Make pdf",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Nextpage extends StatefulWidget {
  final String name;
  final String address;
  final String contact;
  final String email;
  final String skills;
  final String experience;
  final pdf = pw.Document();
  Nextpage({required this.name, required this.address , required this.contact , required this.email, required this.skills, required this.experience});
  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      // maxPageWidth: 1000,
      // useActions: false,
      // canChangePageFormat: true,
      canChangeOrientation: false,
      // pageFormats:pageformat,
      canDebug: false,

      build: (format) => generateDocument(
        format,
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);

    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();

    doc.addPage(
        pw.Page(
          pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
          marginBottom: 20,
          marginLeft: 30,
          marginRight: 30,
          marginTop: 20,
        ),
            orientation: pw.PageOrientation.portrait,
            theme: pw.ThemeData.withFont(
              base: font1,
              bold: font2,
            ),
          ),
          build: (context) {
            return pw.Center(
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      height: 20,
                    ),
                    pw.Center(
                      child: pw.Text(
                        'CV',
                        style: pw.TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    pw.SizedBox(
                      height: 20,
                    ),
                    pw.Row(
                      // mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Name : ',
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        pw.Text("${widget.name}",
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      //mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Address : ',
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        pw.Text(
                          "${widget.address}",
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                     // mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Contact : ',
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        pw.Text(
                          "${widget.contact}",
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      // mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          "Email : ",
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        pw.Text(
                          "${widget.email}",
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      height: 30,
                    ),
                    pw.Row(
                      // mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          "Skills : ",
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                       // mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Expanded(flex:1,
                            child: pw.Container()),
                        pw.Expanded(
                          flex: 9,
                          child: pw.Text(
                          "${widget.skills }",
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),)
                      ],
                    ),
                    pw.SizedBox(
                      height: 20,
                    ),
                    pw.Row(
                      // mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          "Experiences : ",
                          style: pw.TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      // mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Expanded(flex:1,
                            child: pw.Container()),
                        pw.Expanded(
                          flex: 9,
                          child: pw.Text(
                            "${widget.experience }",
                            style: pw.TextStyle(
                              fontSize: 20,
                            ),
                          ),)
                      ],
                    ),
                  ],
                ));
          },
        ),
    );
    return doc.save();
  }
}
