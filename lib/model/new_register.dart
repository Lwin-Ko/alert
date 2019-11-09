import 'package:flutter/material.dart';
import 'package:flutter_app/model/raised_button.dart';
import 'package:flutter_app/widgets/loading_dialog.dart';
import 'package:flutter_app/widgets/notifications.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'simple_register_form_bloc.dart';

import 'package:flutter/widgets.dart';

import '../NRC_db/getNRC.dart';

class SimpleRegisterForm extends StatefulWidget {
  @override
  _SimpleRegisterFormState createState() => _SimpleRegisterFormState();
}

class _SimpleRegisterFormState extends State<SimpleRegisterForm> {
  SimpleRegisterFormBloc _formBloc;
  List<FocusNode> _focusNodes;
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
    _formBloc = SimpleRegisterFormBloc();
    _focusNodes = [FocusNode(), FocusNode(), FocusNode()];
    super.initState();
  }

  @override
  void dispose() {
    _formBloc.close();
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fresher Student register')),
      body: FormBlocListener<SimpleRegisterFormBloc, String, String>(
        formBloc: _formBloc,
        onSubmitting: (context, state) => LoadingDialog.show(context),
        onSuccess: (context, state) {
          LoadingDialog.hide(context);
          Navigator.of(context).pushReplacementNamed('success');
        },
        onFailure: (context, state) {
          LoadingDialog.hide(context);
          Notifications.showSnackBarWithError(context, state.failureResponse);
        },
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            const SizedBox(height: 16.0),
            TextFieldBlocBuilder(
              textFieldBloc: _formBloc.emailField,
              autofocus: true,
              nextFocusNode: _focusNodes[0],
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'နာမည်',
                prefixIcon: Icon(Icons.account_circle),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFieldBlocBuilder(
              textFieldBloc: _formBloc.passwordField,
              focusNode: _focusNodes[0],
              nextFocusNode: _focusNodes[1],
              decoration: InputDecoration(
                labelText: 'အဖေနာမည်',
                prefixIcon: Icon(Icons.account_box),
              ),
            ),
            const SizedBox(width: 20),
            const SizedBox(height: 5),
            Text('မှတ်ပုံတင်အမှတ်'),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                const SizedBox(width: 10),
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
                const SizedBox(width: 20),
                const SizedBox(height: 8.0),
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
                const SizedBox(width: 20),
                const SizedBox(height: 8.0),
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
                const SizedBox(height: 8.0),
                Flexible(
                  flex: 2,
                  child: Container(
                    // use this to match the Flex size..., is like using Expanded.
                    width: double.infinity,
                    // container defines the BoxConstrains of the children
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      border: Border.all(color: Colors.white, width: 10),

                    ),

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
            const SizedBox(height: 16.0),
            CheckboxFieldBlocBuilder(
              booleanFieldBloc: _formBloc.termAndConditionsField,
              body: Text('I Agree to the terms & conditions.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      KRaisedButton(
                        radius: 30.0,
                        color: Colors.teal,
                        text: 'Register',
                        textColor: Colors.white,
                        textFontWeight: FontWeight.bold,
                        onPressed: _submit,

                      ),
                    ],
                  )
                  
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

  void _submit() {
    var _formKey;
    if (_formKey.currentState.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new SimpleRegisterForm();
      }));
    }
  }

}
