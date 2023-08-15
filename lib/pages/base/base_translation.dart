import 'package:easy_localization/easy_localization.dart';

mixin class BaseTranslation {
  String get route => throw UnimplementedError();
  String tran(String key) => tr("$route.$key");
}

String genTr(String key, {String route = "general"}) => tr("$route.$key");
