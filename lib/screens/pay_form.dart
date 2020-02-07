import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PayForm extends StatefulWidget {
  @override
  PayFormState createState() {
    return PayFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class PayFormState extends State<PayForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: 'Enter your username'),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Enter what you paid for'),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Enter amount you paid'),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        SizedBox(height: 15),
        RaisedButton(
          color: Colors.white,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          onPressed: () {
            // Validate returns true if the form is valid, otherwise false.
            if (_formKey.currentState.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.

              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data')));
            }
          },
          child: Text('Submit'),
        )
      ]),
    );
  }
}
