library form_helper;

export 'src/form_helper_base.dart';

import 'src/generator.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder firestoreSerializer(BuilderOptions options) =>
    SharedPartBuilder([FormHelperGenerator()], 'form_helper');
