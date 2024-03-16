class PeriodException implements Exception {
  final String message;

  PeriodException({required this.message});

  PeriodException.generic()
      : message = 'Não foi possivel acessar o banco de dados.';
}
