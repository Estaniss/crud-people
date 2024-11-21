import Foundation

var pessoas: [String: [String]] = [:]

func exibirListaDePessoas() {
    print(pessoas)
}

func criarPessoa() {
    print("Digite o nome:")
    let nome = readLine() ?? ""
    
    if pessoas[nome] != nil {
        print("Erro: O nome já existe. Não é permitido duplicar nomes.")
        return
    }
    
    print("Digite o email:")
    let email = readLine() ?? ""
    
    print("Digite o telefone:")
    let telefone = readLine() ?? ""
    
    print("Digite a idade:")
    let idade = readLine() ?? ""
    
    pessoas[nome] = [email, telefone, idade]
    print("Pessoa criada com sucesso!")
    exibirListaDePessoas()
}

func alterarPessoa() {
    print("Digite o nome da pessoa que deseja alterar:")
    let nome = readLine() ?? ""
    
    if let _ = pessoas[nome] {
        print("Digite o novo email:")
        let novoEmail = readLine() ?? ""
        
        print("Digite o novo telefone:")
        let novoTelefone = readLine() ?? ""
        
        print("Digite a nova idade:")
        let novaIdade = readLine() ?? ""
        
        pessoas[nome] = [novoEmail, novoTelefone, novaIdade]
        print("Dados da pessoa alterados com sucesso!")
        exibirListaDePessoas()
    } else {
        print("Erro: Nome não encontrado.")
    }
}

func apagarPessoa() {
    print("Digite o nome da pessoa que deseja apagar:")
    let nome = readLine() ?? ""
    
    if let _ = pessoas.removeValue(forKey: nome) {
        print("Pessoa removida com sucesso!")
        exibirListaDePessoas()
    } else {
        print("Erro: Nome não encontrado.")
    }
}

func buscarPessoa() {
    print("Digite o nome da pessoa que deseja buscar:")
    let nome = readLine() ?? ""
    
    if let dados = pessoas[nome] {
        print("Nome: \(nome)")
        print("Email: \(dados[0])")
        print("Telefone: \(dados[1])")
        print("Idade: \(dados[2])")
    } else {
        print("Erro: Nome não encontrado.")
    }
    exibirListaDePessoas()
}

func exibirTodasAsPessoas() {
    if pessoas.isEmpty {
        print("Nenhuma pessoa cadastrada.")
    } else {
        for (nome, dados) in pessoas {
            print("Nome: \(nome)")
            print("Email: \(dados[0])")
            print("Telefone: \(dados[1])")
            print("Idade: \(dados[2])")
        }
    }
    exibirListaDePessoas()
}

func menu() {
    var opcao: Int = 0
    repeat {
        print("""
        \nMenu Principal:
        1. Criar nova pessoa
        2. Alterar pessoa existente
        3. Apagar pessoa
        4. Buscar pessoa pelo nome
        5. Exibir todas as pessoas
        6. Sair
        """)
        
        if let input = readLine(), let escolha = Int(input) {
            opcao = escolha
        }
        
        switch opcao {
        case 1:
            criarPessoa()
        case 2:
            alterarPessoa()
        case 3:
            apagarPessoa()
        case 4:
            buscarPessoa()
        case 5:
            exibirTodasAsPessoas()
        case 6:
            print("Saindo...")
        default:
            print("Opção inválida. Tente novamente.")
        }
    } while opcao != 6
}

menu()