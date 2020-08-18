String getErrorString(String code) {
  switch (code) {
    case 'ERROR_WEAK_PASSWORD':
      return 'Senha é muito fraca.';
    case 'ERROR_INVALID_EMAIL':
      return 'E-mail inválido.';
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return 'E-mail já utilizado por outro usuário.';
    case 'ERROR_INVALID_CREDENTIAL':
      return 'E-mail é inválido.';
    case 'ERROR_WRONG_PASSWORD':
      return 'Senha inválida.';
    case 'ERROR_USER_NOT_FOUND':
      return 'E-mail não encontrado.';
    case 'ERROR_USER_DISABLED':
      return 'Usuário desabilitado.';
    case 'ERROR_TOO_MANY_REQUESTS':
      return 'Muitas solicitações. Tente novamente mais tarde.';
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'Operação não permitida.';
    default:
      return 'Ocorreu um erro durante a solicitação.';
  }
}
