// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Oyattt';

  @override
  String get welcome => 'Welcome';

  @override
  String get ticTacToeGame => 'Tic Tac Toe Game';

  @override
  String get start => 'START';

  @override
  String get newUser => 'New user';

  @override
  String get whatsYourName => 'What\'s your name?';

  @override
  String get name => 'Name';

  @override
  String get validate => 'Validate';

  @override
  String get newGame => 'NEW GAME';

  @override
  String get statistics => 'STATISTICS';

  @override
  String get settings => 'SETTINGS';

  @override
  String get changeUser => 'Change user';

  @override
  String get character => 'Character';

  @override
  String get player1 => 'Player 1';

  @override
  String get player2 => 'Player 2';

  @override
  String playerWithName(String player, String name) {
    return '$player | $name';
  }

  @override
  String get character1 => 'Character 1';

  @override
  String get character2 => 'Character 2';

  @override
  String get mode => 'Mode';

  @override
  String get computer => 'Computer';

  @override
  String playerWon(String name) {
    return '$name won';
  }

  @override
  String get draw => 'Draw';

  @override
  String get exit => 'EXIT';

  @override
  String get chooseYourFavoriteCharacter => 'Choose your favorite character';

  @override
  String get gameMode => 'Game mode';

  @override
  String get cancel => 'CANCEL';

  @override
  String get users => 'Users';

  @override
  String get createNewUser => 'Create a new user';

  @override
  String modeWithName(String mode) {
    return '$mode Mode';
  }

  @override
  String get readyToStart => 'Ready to Start?';

  @override
  String get vs => 'VS';

  @override
  String get startGame => 'START GAME';

  @override
  String get userSettings => 'User settings';

  @override
  String get editName => 'Edit name';

  @override
  String get changeFavoriteCharacter => 'Change favorite character';

  @override
  String get back => 'BACK';

  @override
  String get editUser => 'Edit user';

  @override
  String get statisticsTitle => 'Statistics';

  @override
  String get yourStatistics => 'Your Statistics';

  @override
  String get wins => 'Wins';

  @override
  String get losses => 'Losses';

  @override
  String get totalGames => 'Total Games';

  @override
  String get winRate => 'Win Rate';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get hapticFeedback => 'Haptic Feedback';

  @override
  String get disableVisualEffects => 'Disable Visual Effects';

  @override
  String get classicMode => 'Classic';

  @override
  String get metaMode => 'Meta';

  @override
  String get classicModeDescription => 'Traditional 3x3 Tic-Tac-Toe';

  @override
  String get metaModeDescription => 'Ultimate Tic-Tac-Toe: 9 boards in one!';
}
