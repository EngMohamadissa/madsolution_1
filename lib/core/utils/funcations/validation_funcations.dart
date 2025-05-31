import 'package:flutter/material.dart';

String? checkValidate(data) {
  if (data!.isEmpty) {
    return 'لا يمكن ترك هذا الحقل فارغ';
  }
  return null;
}

validateAndSubmit(GlobalKey<FormState> formKey) {
  if (formKey.currentState!.validate()) {
    return true;
  } else {
    return false;
  }
}

// const bool iconpasswrd=false;
