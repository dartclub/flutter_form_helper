/* form_helper for flutter annotations */
library form_helper_annotations;

import 'package:flutter/material.dart';

class FormHelper {
  final GlobalKey<FormState> formKey;

  FormHelper(this.formKey);
}

class FormAttribute {
  final ValueChanged<String> onChanged;
  final GestureTapCallback onTap;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final dynamic initialValue;
  FormAttribute(
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.initialValue,
  );
}
