import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'Form2.dart';

class Form1 extends StatefulWidget {
  const Form1({Key key, String username}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Form1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Student Registration')),
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: new Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'အမည်(English လို)',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'အမည်ထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'အမည်(Myanmar လို)',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'အမည်ထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ခုံနံပါတ်',
                      prefixIcon: Icon(Icons.info),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'ခုံနံပါတ်ထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'တက္ကသိုလ်မှတ်ပုံတင်အမှတ်',
                      prefixIcon: Icon(Icons.info),
                    ),
                    keyboardType:TextInputType.number,
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'တက္ကသိုလ်မှတ်ပုံတင်အမှတ်ထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'တက္ကသိုလ်ဝင်ရောက်သည့်ခုနှစ်',
                      prefixIcon: Icon(Icons.info),
                    ),
                    keyboardType:TextInputType.number,
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'တက္ကသိုလ်ဝင်ရောက်သည့်ခုနှစ်ထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: OutlineButton(
                      highlightedBorderColor: Colors.black,
                      onPressed: _submit,
                      child: Center(child: Text('NEXT')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new Form2();
      }));
    }
  }
}
