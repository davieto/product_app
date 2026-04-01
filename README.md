# PRODUCT_APP
Aplicação Flutter com consumo de API, navegação entre telas, gerenciamento de estado e arquitetura em camadas.

**Disciplina:** Desenvolvimento para Dispositivos Móveis II  
**Tema:** Arquitetura + Navegação + Estado  
**API utilizada:** https://fakestoreapi.com/products  

---

# 1. Introdução

Este projeto consiste na evolução de uma aplicação Flutter iniciada em aula, com o objetivo de aplicar conceitos reais de desenvolvimento mobile.

A aplicação consome uma API pública de produtos e foi evoluída para incluir:

- Arquitetura em camadas
- Navegação entre múltiplas telas
- Gerenciamento de estado
- Sistema de favoritos
- Tratamento de erros
- Cache local simples

O sistema simula um pequeno catálogo de produtos, permitindo visualizar, navegar e interagir com os dados.

---

# 2. Funcionalidades

A aplicação possui as seguintes funcionalidades:

- Tela inicial com acesso à listagem
- Listagem de produtos via API
- Tela de detalhes do produto
- Exibição de imagem, título, preço e descrição
- Marcar e desmarcar produtos como favoritos
- Atualização automática da interface
- Tratamento de erros de requisição
- Cache local em caso de falha da API

---

# 3. Estrutura Arquitetural

O projeto foi organizado seguindo o padrão de arquitetura em camadas:

lib
├── core
│
├── data
│ ├── datasources
│ ├── models
│ └── repositories
│
├── domain
│ ├── entities
│ └── repositories
│
└── presentation
├── pages
├── viewmodels
└── widgets


---

## Camadas

### Domain
Responsável pelas regras de negócio e entidades.

### Data
Responsável pelo acesso a dados (API e cache).

### Presentation
Responsável pela interface e interação com o usuário.

---

# 4. Navegação da Aplicação

Fluxo implementado:

Tela Inicial  
→ Tela de Produtos  
→ Tela de Detalhes  

A navegação foi implementada utilizando:

- `Navigator.push()`
- `Navigator.pop()`

---

# 5. Gerenciamento de Estado

Foram utilizadas abordagens estudadas em aula:

- Provider
- Riverpod
- BLoC

Além disso, foi implementado:

- Sistema de favoritos
- Atualização automática da UI ao alterar estado

---

# 6. Estado da Interface

A aplicação trata diferentes estados:

- `Loading`
- `Success`
- `Error`

Isso garante uma melhor experiência do usuário.

---

# 7. Tratamento de Erros

A aplicação captura falhas de requisição HTTP e:

- Exibe mensagem de erro
- Permite tentar novamente
- Evita quebra da aplicação

---

# 8. Cache Local

Foi implementado cache simples no Repository:

Fluxo:

1. Busca dados da API  
2. Salva em memória  
3. Em caso de erro, usa cache  
4. Se não houver cache → erro  

---

# 9. Problemas Encontrados

Durante o desenvolvimento:

- Instabilidade da API (erro 523 – Cloudflare)
- Falha no carregamento de imagens
- API temporariamente indisponível

Esses problemas reforçam a importância de:

- Tratamento de erros
- Cache local

---

# 10. Questionário – Arquitetura

## 1 - Em qual camada foi implementado o cache?

Na camada Repository, pois ela decide a origem dos dados.

---

## 2 - Por que o ViewModel não deve fazer HTTP?

Para manter separação de responsabilidades.

---

## 3 - O que acontece se a UI acessar o DataSource?

Forte acoplamento e dificuldade de manutenção.

---

## 4 - Como trocar API por banco local?

Basta trocar a implementação do Repository.

---

# 11. Questionário – Navegação

## 1 - Estrutura antes?

Uma única tela com listagem.

---

## 2 - Fluxo depois?

Tela Inicial → Produtos → Detalhes

---

## 3 - Função do push?

Abrir nova tela.

---

## 4 - Função do pop?

Voltar tela anterior.

---

## 5 - Como dados foram enviados?

Via construtor usando Navigator.push.

---

## 6 - Por que detalhes dependem da anterior?

Porque precisam do produto selecionado.

---

## 7 - Principais mudanças?

- Múltiplas telas  
- Navegação  
- Organização  
- Separação de responsabilidades  

---

## 8 - Dificuldades?

- Navegação  
- Passagem de dados  
- Estrutura do projeto  

---

# 12. Questionário – Gerenciamento de Estado

## 1 - Como o estado afeta a UI?

Qualquer mudança no estado atualiza automaticamente a interface.

---

## 2 - Onde o estado é armazenado?

Nos Providers / ViewModels.

---

## 3 - O que acontece ao favoritar?

O estado muda e a UI reflete imediatamente.

---

## 4 - Qual vantagem do gerenciamento de estado?

Separação da lógica da interface.

---

# 13. Conclusão

O projeto demonstrou na prática:

- Organização com arquitetura em camadas
- Navegação entre telas
- Gerenciamento de estado
- Tratamento de erros reais
- Uso de cache

Esses conceitos são fundamentais para aplicações reais em Flutter.

---

# Autor

Nome: Davieto  
Baseado nas aulas do professor Jefferson Speck  

Data: 2026
