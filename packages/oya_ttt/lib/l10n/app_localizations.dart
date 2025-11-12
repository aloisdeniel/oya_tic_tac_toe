import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// The application title
  ///
  /// In en, this message translates to:
  /// **'Oyattt'**
  String get appTitle;

  /// Welcome message on onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Game description on onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Tic Tac Toe Game'**
  String get ticTacToeGame;

  /// Start button label
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get start;

  /// New user status text
  ///
  /// In en, this message translates to:
  /// **'New user'**
  String get newUser;

  /// Name input modal title
  ///
  /// In en, this message translates to:
  /// **'What\'s your name?'**
  String get whatsYourName;

  /// Name input field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Validate button label
  ///
  /// In en, this message translates to:
  /// **'Validate'**
  String get validate;

  /// New game button label
  ///
  /// In en, this message translates to:
  /// **'NEW GAME'**
  String get newGame;

  /// Statistics button label
  ///
  /// In en, this message translates to:
  /// **'STATISTICS'**
  String get statistics;

  /// Settings button label
  ///
  /// In en, this message translates to:
  /// **'SETTINGS'**
  String get settings;

  /// Change user status text
  ///
  /// In en, this message translates to:
  /// **'Change user'**
  String get changeUser;

  /// Character selection label
  ///
  /// In en, this message translates to:
  /// **'Character'**
  String get character;

  /// Player 1 label
  ///
  /// In en, this message translates to:
  /// **'Player 1'**
  String get player1;

  /// Player 2 label
  ///
  /// In en, this message translates to:
  /// **'Player 2'**
  String get player2;

  /// Player with name format
  ///
  /// In en, this message translates to:
  /// **'{player} | {name}'**
  String playerWithName(String player, String name);

  /// Character 1 selection label
  ///
  /// In en, this message translates to:
  /// **'Character 1'**
  String get character1;

  /// Character 2 selection label
  ///
  /// In en, this message translates to:
  /// **'Character 2'**
  String get character2;

  /// Mode selection label
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get mode;

  /// Computer player label
  ///
  /// In en, this message translates to:
  /// **'Computer'**
  String get computer;

  /// Winner announcement
  ///
  /// In en, this message translates to:
  /// **'{name} won'**
  String playerWon(String name);

  /// Draw result
  ///
  /// In en, this message translates to:
  /// **'Draw'**
  String get draw;

  /// Exit button label
  ///
  /// In en, this message translates to:
  /// **'EXIT'**
  String get exit;

  /// Character selection screen title
  ///
  /// In en, this message translates to:
  /// **'Choose your favorite character'**
  String get chooseYourFavoriteCharacter;

  /// Game mode selection title
  ///
  /// In en, this message translates to:
  /// **'Game mode'**
  String get gameMode;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get cancel;

  /// Users selection screen title
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// Create new user button label
  ///
  /// In en, this message translates to:
  /// **'Create a new user'**
  String get createNewUser;

  /// Mode with name format
  ///
  /// In en, this message translates to:
  /// **'{mode} Mode'**
  String modeWithName(String mode);

  /// Ready to start game title
  ///
  /// In en, this message translates to:
  /// **'Ready to Start?'**
  String get readyToStart;

  /// Versus text
  ///
  /// In en, this message translates to:
  /// **'VS'**
  String get vs;

  /// Start game button label
  ///
  /// In en, this message translates to:
  /// **'START GAME'**
  String get startGame;

  /// User settings screen title
  ///
  /// In en, this message translates to:
  /// **'User settings'**
  String get userSettings;

  /// Edit name button label
  ///
  /// In en, this message translates to:
  /// **'Edit name'**
  String get editName;

  /// Change favorite character button label
  ///
  /// In en, this message translates to:
  /// **'Change favorite character'**
  String get changeFavoriteCharacter;

  /// Back button label
  ///
  /// In en, this message translates to:
  /// **'BACK'**
  String get back;

  /// Edit user status text
  ///
  /// In en, this message translates to:
  /// **'Edit user'**
  String get editUser;

  /// Statistics screen title
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statisticsTitle;

  /// Your statistics header
  ///
  /// In en, this message translates to:
  /// **'Your Statistics'**
  String get yourStatistics;

  /// Wins label
  ///
  /// In en, this message translates to:
  /// **'Wins'**
  String get wins;

  /// Losses label
  ///
  /// In en, this message translates to:
  /// **'Losses'**
  String get losses;

  /// Total games label
  ///
  /// In en, this message translates to:
  /// **'Total Games'**
  String get totalGames;

  /// Win rate label
  ///
  /// In en, this message translates to:
  /// **'Win Rate'**
  String get winRate;

  /// Back to home button label
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
