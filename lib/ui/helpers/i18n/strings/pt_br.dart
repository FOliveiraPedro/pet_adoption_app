import 'translations.dart';

class PtBr implements Translations {
  @override
  String get msgEmailInUse => 'O email já está em uso.';
  @override
  String get msgInvalidCredentials => 'Credenciais inválidas.';
  @override
  String get msgInvalidField => 'Campo inválido';
  @override
  String get msgRequiredField => 'Campo obrigatório';
  @override
  String get msgUnexpectedError => 'Algo de errado aconteceu. Tente novamente em breve.';
  @override
  String get msgWhatsappdError => 'Algo de errado aconteceu ao iniciar o WhatsApp.';
  @override
  String get msgPhoneNotFounded => 'Celular não cadastrado no sistema';
  @override
  String get msgInvalidSmsCode => 'Código inválido. Tente novamente.';
  @override
  String get msgProfessionalNotAllocated => 'Este profissional ainda não foi alocado em nenhuma equipe.';
  @override
  String get msgTeamWithoutVan => 'A equipe não está vinculada a uma van.';
  @override
  String get msgAlreadyInformedSignage => 'A sinalização do banho já foi informada!';

  @override
  String get addAccount => 'Criar conta';
  @override
  String get emailField => 'Email';
  @override
  String get login => 'Login';
  String get confirm => 'Confirmar';
  String get advance => 'Avançar';
  @override
  String get name => 'Nome';
  @override
  String get password => 'Senha';
  @override
  String get confirmPassword => 'Confirmar senha';
  @override
  String get signUp => 'Finalizar cadastro';
  @override
  String get register => 'Cadastro';

  // LABELS
  @override
  String get phone => 'Celular';
  @override
  String get goBack => 'Voltar';
  @override
  String get resendCode => 'Reenviar código';
  @override
  String get whatsapp => 'Fale com a gente pelo whatsapp';

  @override
  String get cep => 'CEP';
  @override
  String get address => 'Endereço*';
  @override
  String get number => 'Número*';
  @override
  String get complement => 'Complemento';
  @override
  String get neighborhood => 'Bairro*';
  @override
  String get city => 'Cidade*';
  @override
  String get state => 'Estado*';
  @override
  String get reference => 'Ponto de referência*';
  @override
  String get checkAvailable => 'Verificar disponibilidade';
  @override
  String get tryAnother => 'Tentar outro endereço';
  @override
  String get notifyLater => 'Me avise quando estiver disponível';
  String get landmarkInput => 'Ponto de referência';
  String get anomalyRecord => 'Registro de anomalia';
}
