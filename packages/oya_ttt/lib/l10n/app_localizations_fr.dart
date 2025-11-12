// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Oyattt';

  @override
  String get welcome => 'Bienvenue';

  @override
  String get ticTacToeGame => 'Jeu de Morpion';

  @override
  String get start => 'COMMENCER';

  @override
  String get newUser => 'Nouvel utilisateur';

  @override
  String get whatsYourName => 'Quel est votre nom ?';

  @override
  String get name => 'Nom';

  @override
  String get validate => 'Valider';

  @override
  String get newGame => 'NOUVELLE PARTIE';

  @override
  String get statistics => 'STATISTIQUES';

  @override
  String get settings => 'PARAMÈTRES';

  @override
  String get changeUser => 'Changer d\'utilisateur';

  @override
  String get character => 'Personnage';

  @override
  String get player1 => 'Joueur 1';

  @override
  String get player2 => 'Joueur 2';

  @override
  String playerWithName(String player, String name) {
    return '$player | $name';
  }

  @override
  String get character1 => 'Personnage 1';

  @override
  String get character2 => 'Personnage 2';

  @override
  String get mode => 'Mode';

  @override
  String get computer => 'Ordinateur';

  @override
  String playerWon(String name) {
    return '$name a gagné';
  }

  @override
  String get draw => 'Match nul';

  @override
  String get exit => 'QUITTER';

  @override
  String get chooseYourFavoriteCharacter =>
      'Choisissez votre personnage préféré';

  @override
  String get gameMode => 'Mode de jeu';

  @override
  String get cancel => 'ANNULER';

  @override
  String get users => 'Utilisateurs';

  @override
  String get createNewUser => 'Créer un nouvel utilisateur';

  @override
  String modeWithName(String mode) {
    return 'Mode $mode';
  }

  @override
  String get readyToStart => 'Prêt à commencer ?';

  @override
  String get vs => 'VS';

  @override
  String get startGame => 'COMMENCER LA PARTIE';

  @override
  String get userSettings => 'Paramètres utilisateur';

  @override
  String get editName => 'Modifier le nom';

  @override
  String get changeFavoriteCharacter => 'Changer le personnage préféré';

  @override
  String get back => 'RETOUR';

  @override
  String get editUser => 'Modifier l\'utilisateur';

  @override
  String get statisticsTitle => 'Statistiques';

  @override
  String get yourStatistics => 'Vos statistiques';

  @override
  String get wins => 'Victoires';

  @override
  String get losses => 'Défaites';

  @override
  String get totalGames => 'Parties totales';

  @override
  String get winRate => 'Taux de victoire';

  @override
  String get backToHome => 'Retour à l\'accueil';
}
