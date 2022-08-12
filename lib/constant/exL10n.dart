import 'package:intl/intl.dart';

import '../generated/l10n.dart';

extension ExS on S {
  String get(final String key) {
    return Intl.message(
      '',
      name: key,
      desc: '',
      args: [],
    );
  }
}
