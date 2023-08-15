class R {
  static const String translationsPathPrefix = 'translations';
  R._();

  static final assets = _ResAssets();
}

class _ResAssets {
  final clip = _svg('clip');
}

String _svg(String fileName) {
  return 'icons/$fileName.svg';
}

String _png(String fileName) {
  return 'images/$fileName.png';
}

String _json(String fileName) {
  return 'animations/$fileName.json';
}
