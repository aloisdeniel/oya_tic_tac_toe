class AppThemeSpacingData {
  const AppThemeSpacingData({
    required this.tiny,
    required this.small,
    required this.regular,
    required this.medium,
    required this.large,
    required this.xlarge,
  });

  AppThemeSpacingData.regular()
      : tiny = 4,
        small = 12,
        regular = 16,
        medium = 24,
        large = 48,
        xlarge = 60;

  AppThemeSpacingData.small()
      : tiny = 4,
        small = 8,
        regular = 12,
        medium = 16,
        large = 32,
        xlarge = 42;

  final double tiny;
  final double small;
  final double regular;
  final double medium;
  final double large;
  final double xlarge;
}
