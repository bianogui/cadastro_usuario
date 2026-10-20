# Cadastro de Usuário — Flutter

Atividade prática da disciplina **Desenvolvimento Mobile (Flutter e Dart)**: formulários e validações.

## Funcionalidades

- Campos: nome completo, e-mail, CPF, telefone, senha e confirmação de senha (`TextFormField` dentro de um `Form`)
- `keyboardType` e `inputFormatters` por campo (CPF e telefone aceitam só números)
- Validações:
  - todos os campos são obrigatórios
  - e-mail precisa ter `@` e passar por uma `RegExp`
  - senha com no mínimo 6 caracteres
  - CPF com 11 dígitos; telefone com 10 ou 11 dígitos
- Erros exibidos abaixo de cada campo inválido
- SnackBar verde de sucesso e SnackBar vermelho quando há erros

### Desafios implementados

- [x] Confirmação de senha
- [x] Botão para mostrar/ocultar a senha
- [x] Validação de e-mail com RegExp
- [x] SnackBar de erro em vermelho

## Estrutura da tela

```
Scaffold
└── Form(key: _formKey)
    └── SingleChildScrollView
        └── Column
            ├── TextFormField (nome)
            ├── TextFormField (e-mail)
            ├── TextFormField (CPF)
            ├── TextFormField (telefone)
            ├── TextFormField (senha)
            ├── TextFormField (confirmar senha)
            └── ElevatedButton (CADASTRAR)
```

## Como executar

```bash
flutter create .      # gera as pastas de plataforma (android, ios, web...)
flutter pub get
flutter run
```

## Resultado

<!-- Coloque aqui o print do app funcionando -->
![Print do app](docs/print.png)
