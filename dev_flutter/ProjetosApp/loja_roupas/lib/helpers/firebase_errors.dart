String getErrorString(String code) {
  switch (code) {
    case 'firebase_auth/app-deleted':
      return 'O banco de dados não foi localizado.';
    case 'firebase_auth/expired-action-code':
      return 'O código da ação o ou link expirou.';
    case 'firebase_auth/invalid-action-code':
      return 'O código da ação é inválido. Isso pode acontecer se o código estiver malformado ou já tiver sido usado.';
    case 'firebase_auth/user-disabled':
      return 'O usuário correspondente à credencial fornecida foi desativado.';
    case 'firebase_auth/user-not-found':
      return 'O usuário não corresponde à nenhuma credencial.';
    case 'firebase_auth/weak-password':
      return 'A senha é muito fraca.';
    case 'firebase_auth/email-already-in-use':
      return 'Já existi uma conta com o endereço de email fornecido.';
    case 'firebase_auth/invalid-email':
      return 'O endereço de e-mail não é válido.';
    case 'firebase_auth/operation-not-allowed':
      return 'O tipo de conta correspondente à esta credencial, ainda não encontra-se ativada.';
    case 'firebase_auth/account-exists-with-different-credential':
      return 'E-mail já associado a outra conta.';
    case 'firebase_auth/auth-domain-config-required':
      return 'A configuração para autenticação não foi fornecida.';
    case 'firebase_auth/credential-already-in-use':
      return 'Já existe uma conta para esta credencial.';
    case 'firebase_auth/operation-not-supported-in-this-environment':
      return 'Esta operação não é suportada no ambiente que está sendo executada. Verifique se deve ser http ou https.';
    case 'firebase_auth/timeout':
      return 'Excedido o tempo de resposta. O domínio pode não estar autorizado para realizar operações.';
    case 'firebase_auth/missing-android-pkg-name':
      return 'Deve ser fornecido um nome de pacote para instalação do aplicativo Android.';
    case 'firebase_auth/missing-continue-uri':
      return 'A próxima URL deve ser fornecida na solicitação.';
    case 'firebase_auth/missing-ios-bundle-id':
      return 'Deve ser fornecido um nome de pacote para instalação do aplicativo iOS.';
    case 'firebase_auth/invalid-continue-uri':
      return 'A próxima URL fornecida na solicitação é inválida.';
    case 'firebase_auth/unauthorized-continue-uri':
      return 'O domínio da próxima URL não está na lista de autorizações.';
    case 'firebase_auth/invalid-dynamic-link-domain':
      return 'O domínio de link dinâmico fornecido, não está autorizado ou configurado no projeto atual.';
    case 'firebase_auth/argument-error':
      return 'Verifique a configuração de link para o aplicativo.';
    case 'firebase_auth/invalid-persistence-type':
      return 'O tipo especificado para a persistência dos dados é inválido.';
    case 'firebase_auth/unsupported-persistence-type':
      return 'O ambiente atual não suportar o tipo especificado para persistência dos dados.';
    case 'firebase_auth/invalid-credential':
      return 'A credencial expirou ou está mal formada.';
    case 'firebase_auth/wrong-password':
      return 'Senha incorreta.';
    case 'firebase_auth/invalid-verification-code':
      return 'O código de verificação da credencial não é válido.';
    case 'firebase_auth/invalid-verification-id':
      return 'O ID de verificação da credencial não é válido.';
    case 'firebase_auth/custom-token-mismatch':
      return 'O token está diferente do padrão solicitado.';
    case 'firebase_auth/invalid-custom-token':
      return 'O token fornecido não é válido.';
    case 'firebase_auth/captcha-check-failed':
      return 'O token de resposta do reCAPTCHA não é válido, expirou ou o domínio não é permitido.';
    case 'firebase_auth/invalid-phone-number':
      return 'O número de telefone está em um formato inválido (padrão E.164).';
    case 'firebase_auth/missing-phone-number':
      return 'O número de telefone é requerido.';
    case 'firebase_auth/quota-exceeded':
      return 'A cota de SMS foi excedida.';
    case 'firebase_auth/cancelled-popup-request':
      return 'Somente uma solicitação de janela pop-up é permitida de uma só vez.';
    case 'firebase_auth/popup-blocked':
      return 'A janela pop-up foi bloqueado pelo navegador.';
    case 'firebase_auth/popup-closed-by-user':
      return 'A janela pop-up foi fechada pelo usuário sem concluir o login no provedor.';
    case 'firebase_auth/unauthorized-domain':
      return 'O domínio do aplicativo não está autorizado para realizar operações.';
    case 'firebase_auth/invalid-user-token':
      return 'O usuário atual não foi identificado.';
    case 'firebase_auth/user-token-expired':
      return 'O token do usuário atual expirou.';
    case 'firebase_auth/null-user':
      return 'O usuário atual é nulo.';
    case 'firebase_auth/app-not-authorized':
      return 'Aplicação não autorizada para autenticar com a chave informada.';
    case 'firebase_auth/invalid-api-key':
      return 'A chave da API fornecida é inválida.';
    case 'firebase_auth/network-request-failed':
      return 'Falha de conexão com a rede.';
    case 'firebase_auth/requires-recent-login':
      return 'O último horário de acesso do usuário não atende ao limite de segurança.';
    case 'firebase_auth/too-many-requests':
      return 'As solicitações foram bloqueadas devido a atividades incomuns. Tente novamente depois que algum tempo.';
    case 'firebase_auth/web-storage-unsupported':
      return 'O navegador não suporta armazenamento ou se o usuário desativou este recurso.';
    case 'firebase_auth/invalid-claims':
      return 'Os atributos de cadastro personalizado são inválidos.';
    case 'firebase_auth/claims-too-large':
      return 'O tamanho da requisição excede o tamanho máximo permitido de 1 Megabyte.';
    case 'firebase_auth/id-token-expired':
      return 'O token informado expirou.';
    case 'firebase_auth/id-token-revoked':
      return 'O token informado perdeu a validade.';
    case 'firebase_auth/invalid-argument':
      return 'Um argumento inválido foi fornecido a um método.';
    case 'firebase_auth/invalid-creation-time':
      return 'O horário da criação precisa ser uma data UTC válida.';
    case 'firebase_auth/invalid-disabled-field':
      return 'A propriedade para usuário desabilitado é inválida.';
    case 'firebase_auth/invalid-display-name':
      return 'O nome do usuário é inválido.';
    case 'firebase_auth/invalid-email-verified':
      return 'O e-mail é inválido.';
    case 'firebase_auth/invalid-hash-algorithm':
      return 'O algoritmo de HASH não é uma criptografia compatível.';
    case 'firebase_auth/invalid-hash-block-size':
      return 'O tamanho do bloco de HASH não é válido.';
    case 'firebase_auth/invalid-hash-derived-key-length':
      return 'O tamanho da chave derivada do HASH não é válido.';
    case 'firebase_auth/invalid-hash-key':
      return 'A chave de HASH precisa ter um buffer de byte válido.';
    case 'firebase_auth/invalid-hash-memory-cost':
      return 'O custo da memória HASH não é válido.';
    case 'firebase_auth/invalid-hash-parallelization':
      return 'O carregamento em paralelo do HASH não é válido.';
    case 'firebase_auth/invalid-hash-rounds':
      return 'O arredondamento de HASH não é válido.';
    case 'firebase_auth/invalid-hash-salt-separator':
      return 'O campo do separador de SALT do algoritmo de geração de HASH precisa ser um buffer de byte válido.';
    case 'firebase_auth/invalid-id-token':
      return 'O código do token informado não é válido.';
    case 'firebase_auth/invalid-last-sign-in-time':
      return 'O último horário de login precisa ser uma data UTC válida.';
    case 'firebase_auth/invalid-page-token':
      return 'A próxima URL fornecida na solicitação é inválida.';
    case 'firebase_auth/invalid-password':
      return 'A senha é inválida, precisa ter pelo menos 6 caracteres.';
    case 'firebase_auth/invalid-password-hash':
      return 'O HASH da senha não é válida.';
    case 'firebase_auth/invalid-password-salt':
      return 'O SALT da senha não é válido.';
    case 'firebase_auth/invalid-photo-url':
      return 'A URL da foto de usuário é inválido.';
    case 'firebase_auth/invalid-provider-id':
      return 'O identificador de provedor não é compatível.';
    case 'firebase_auth/invalid-session-cookie-duration':
      return 'A duração do COOKIE da sessão precisa ser um número válido em milissegundos, entre 5 minutos e 2 semanas.';
    case 'firebase_auth/invalid-uid':
      return 'O identificador fornecido deve ter no máximo 128 caracteres.';
    case 'firebase_auth/invalid-user-import':
      return 'O registro do usuário a ser importado não é válido.';
    case 'firebase_auth/invalid-provider-data':
      return 'O provedor de dados não é válido.';
    case 'firebase_auth/maximum-user-count-exceeded':
      return 'O número máximo permitido de usuários a serem importados foi excedido.';
    case 'firebase_auth/missing-hash-algorithm':
      return 'É necessário fornecer o algoritmo de geração de HASH e seus parâmetros para importar usuários.';
    case 'firebase_auth/missing-uid':
      return 'Um identificador é necessário para a operação atual.';
    case 'firebase_auth/reserved-claims':
      return 'Uma ou mais propriedades personalizadas fornecidas usaram palavras reservadas.';
    case 'firebase_auth/session-cookie-revoked':
      return 'O COOKIE da sessão perdeu a validade.';
    case 'firebase_auth/uid-alread-exists':
      return 'O indentificador fornecido já está em uso.';
    case 'firebase_auth/email-already-exists':
      return 'O e-mail fornecido já está em uso.';
    case 'firebase_auth/phone-number-already-exists':
      return 'O telefone fornecido já está em uso.';
    case 'firebase_auth/project-not-found':
      return 'Nenhum projeto foi encontrado.';
    case 'firebase_auth/insufficient-permission':
      return 'A credencial utilizada não tem permissão para acessar o recurso solicitado.';
    case 'firebase_auth/internal-error':
      return 'O servidor de autenticação encontrou um erro inesperado ao tentar processar a solicitação.';
    default:
      return 'Um Erro inesperado Aconteceu';
  }
}
