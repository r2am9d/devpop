import 'package:devpop/core/l10n/arb/app_localizations.dart';
import 'package:flutter/widgets.dart';

export 'package:devpop/core/l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
