import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:firestore_annotations/firestore_annotations.dart';
import 'package:firestore_serializable/src/helper.dart';
import 'package:firestore_serializable/src/utils.dart' as utils;
import 'package:form_helper_annotations/form_helper_annotations.dart';

class FieldAnnotationHelper {
  FirestoreAttribute attribute = FirestoreAttribute();
  bool hasFirestoreAttribute;

  FieldAnnotationHelper(FieldElement _el) {
    ElementAnnotation firestoreAttributeAnnotation = _el.metadata.firstWhere(
        (ElementAnnotation el) => getName(el.element) == 'FirestoreAttribute',
        orElse: () => null);

    hasFirestoreAttribute = firestoreAttributeAnnotation != null;
    if (hasFirestoreAttribute) {
      DartObject obj = firestoreAttributeAnnotation.computeConstantValue();
      attribute = FirestoreAttribute(
        ignore: obj.getField('ignore').toBoolValue(),
        nullable: obj.getField('nullable').toBoolValue(),
        alias: obj.getField('alias').toStringValue(),
        defaultValue: utils.getLiteral(
          obj.getField('defaultValue'),
          [],
        ),
        flutterValidatorMessage:
            obj.getField("flutterValidatorMessage").toString(),
      );
    }
  }

  get ignore => attribute.ignore;
  get nullable => attribute.nullable;
  get alias => attribute.alias;
  get defaultValue => attribute.defaultValue;
  get flutterValidatorMessage => attribute.flutterValidatorMessage;
}

class ClassAnnotationHelper {
  FormHelper firestoreDocument;
  bool get hasSelfRef => firestoreDocument.hasSelfRef;
  bool get flutterFormHelper => firestoreDocument.flutterFormHelper;

  ClassAnnotationHelper(ClassElement _cl) {
    ElementAnnotation firestoreDocumentAnnotation = _cl.metadata.firstWhere(
        (ElementAnnotation el) => getName(el.element) == 'FirestoreDocument',
        orElse: () => null);

    if (firestoreDocumentAnnotation != null) {
      DartObject obj = firestoreDocumentAnnotation.computeConstantValue();

      firestoreDocument = FormHelper(
        formKey: obj.getField("formKey"),
        //hasSelfRef: obj.getField("hasSelfRef").toBoolValue(),
      );
    }
  }
}
