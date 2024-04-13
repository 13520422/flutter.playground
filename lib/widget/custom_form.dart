import 'package:flutter/material.dart';

Map<String, GlobalKey<FormState>> formIds = {};

///formId, {data}
Map<String, Map<String, dynamic>> formData = {};

bool validateByKey(String key) {
  var _formKey = formIds[key];
  if (_formKey?.currentState?.validate() == true) {
    return true;
  }
  return false;
}

///data add at onSave function at form item
Map<String, dynamic>? getDatFormByKey(String key) {
  var _formKey = formIds[key];
  _formKey?.currentState?.save();

  return formData[key];
}

class CustomForm extends StatefulWidget {
  final String formId;
  final Widget child;
  AutovalidateMode? autovalidateMode;
  CustomForm({super.key, required this.child, this.autovalidateMode, required this.formId});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formIds[widget.formId] = _formKey;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    formIds.remove(widget.formId);
    formData.remove(widget.formId);
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: widget.child,
    );
  }
}
