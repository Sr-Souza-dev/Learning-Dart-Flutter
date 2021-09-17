main() {
  try {
    var age;
    int dogyears = 7;
    //o thron dentro do try cria uma exceção e a encaminha direto para o catch
    if (dogyears != 7) {
      throw new Exception('Os anos de cachorro precisam ser 7');
    }
    //Forçando um erro ja conhecido pela linguagem para que possa ser pego no on
    if (age == null) {
      throw new NullThrownError();
    }

    print(dogyears * age);
  }
  //on trata Erros ja conhecidos e definidos pela linguagem
  on NullThrownError {
    print('O valor é nulo!');
  }
  //O catch mostra o erro (fala o que deve ser feito após a ocorrencia do erro)
  catch (e) {
    print('\nOps, houve um erro com a mensagem!\n\n\n ${e.toString()} \n\n');
  }
  //O finally executa quando acabar o processo, independente se deu erro ou não
   finally {
    print('Executa quando um dos dois é executado até o final');
  }
}
