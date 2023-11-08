class ResumoDTO {
  double totalReceita;
  double totalDespesa;
  double saldo;

  ResumoDTO({
    required this.totalReceita,
    required this.totalDespesa,
    required this.saldo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalReceita': totalReceita,
      'totalDespesa': totalDespesa,
      'saldo': saldo,
    };
  }

  factory ResumoDTO.fromMap(Map<String, dynamic> map) {
    return ResumoDTO(
      totalReceita: map['totalReceita'] as double,
      totalDespesa: map['totalDespesa'] as double,
      saldo: map['saldo'] as double,
    );
  }
}
