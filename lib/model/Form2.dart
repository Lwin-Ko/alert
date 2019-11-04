import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../NRC_db/getNRC.dart';

class Form2 extends StatefulWidget {
  const Form2({Key key, String username}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Form2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  getNRC nrc = getNRC();

  List<String> _codes = [".."];
  List<String> _codeNames = [".."];
  String _selectedCode ;
  String _selectedCodeName;
  String newValue ;

  @override
  void initState() {
    _codes = List.from(_codes)..addAll(nrc.getCodes());
    super.initState();
  }

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
                      labelText: 'လူမျိုး',
                      prefixIcon: Icon(Icons.info),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'လူမျိုးထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ကိုးကွယ်သည့်ဘာသာ',
                      prefixIcon: Icon(Icons.info),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'ဘာသာထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'မွေးဖွားရာဇာတိ',
                      prefixIcon: Icon(Icons.info),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'ဇာတိထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'မြို့နယ်',
                      prefixIcon: Icon(Icons.info),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'မြို့နယ်ထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ပြည်နယ်/တိုင်းဒေသကြီး',
                      prefixIcon: Icon(Icons.info),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'ပြည်နယ်/တိုင်းဒေသကြီးထည့်ရန်လိုသည်';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Text('မှတ်ပုံတင်အမှတ်'),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          // use this to match the Flex size..., is like using Expanded.
                          width: double.infinity,
                          // container defines the BoxConstrains of the children
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            border: Border.all(color: Colors.white, width: 1),
                          ),

                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text('၁၂/'),
                            items: _codes.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            onChanged: (value) => _onSelectedCode(value),
                            value: _selectedCode,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          // use this to match the Flex size..., is like using Expanded.
                          width: double.infinity,
                          // container defines the BoxConstrains of the children
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text('မဂတ'),
                            items: _codeNames.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            // onChanged: (value) => print(value),
                            onChanged: (value) => _onSelectedCodeName(value),
                            value: _selectedCodeName,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          // use this to match the Flex size..., is like using Expanded.
                          width: double.infinity,
                          // container defines the BoxConstrains of the children
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child:DropdownButton<String>(
                              hint: Text('(နိုင်)'),
                              onChanged: (String changedValue) {
                                newValue=changedValue;
                                setState(() {
                                  newValue;
                                  print(newValue);
                                });
                              },
                              value: newValue,
                              items: <String>['(နိုင်)', '(ဧည့်)', '(ပြု)']
                                  .map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList()),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          // use this to match the Flex size..., is like using Expanded.
                          width: double.infinity,
                          // container defines the BoxConstrains of the children

                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '၁၁၀၂၀၃',
                            ),
                            validator: (String value) {
                              if (value.trim().isEmpty) {
                                return 'မှတ်ပုံတင်အမှတ်ထည့်ရန်လိုသည်';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
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
      print('Form submitted');
    }
  }

  void _onSelectedCode(String value) {
    setState(() {
      _selectedCodeName = "..";
      _codeNames = [".."];
      _selectedCode = value;
      _codeNames = List.from(_codeNames)..addAll(nrc.getNameByCode(value));
    });
  }

  void _onSelectedCodeName(String value) {
    setState(() => _selectedCodeName = value);
  }

}
