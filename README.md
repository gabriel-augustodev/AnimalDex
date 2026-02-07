# 🐾 AnimalDex

O **AnimalDex** é um aplicativo mobile desenvolvido em **Flutter** que permite ao usuário **simular a identificação de animais**, salvar os resultados em uma **Pokédex local** e visualizar **detalhes completos** de cada animal identificado.

O projeto é inspirado no conceito de Pokédex, aplicando-o ao mundo real com dados científicos (nome científico, família, grupo, observações, etc.).

---

## 📱 Funcionalidades

- 📷 Simulação de escaneamento de animais
- 🔎 Exibição do resultado do scan
- 💾 Salvamento de animais localmente (Pokédex)
- 📘 Listagem dos animais capturados
- 📄 Tela de detalhes do animal
- 🔗 Link direto para a Wikipedia
- 📦 Funcionamento offline após o salvamento

---

## 🧭 Fluxo do Aplicativo

```
Tela Inicial
   ↓
 ┌──────────────────┬──────────────────┐
 │                  │                  │
Escanear Animal   Minha Pokédex
 │                  │
Simular Scan      Carregar animais salvos
 │                  │
Resultado          Lista de animais
 │                  │
Salvar animal      Clique em um animal
 │                  ↓
Storage Local   Tela de Detalhes
```

---

## 🖼️ Telas do App

### 🏠 Tela Inicial
- Botões:
  - **Escanear Animal**
  - **Minha Pokédex**

### 📷 Tela de Escaneamento
- Simula a identificação de um animal
- Retorna um animal identificado

### 📊 Tela de Resultado
- Exibe:
  - Imagem do animal
  - Nome popular
  - Nome científico
- Opção para salvar o animal

### 📘 Minha Pokédex
- Lista todos os animais capturados
- Caso esteja vazia, exibe mensagem informativa

### 📄 Tela de Detalhes do Animal
Exibe:
- Imagem em destaque
- Nome popular
- Nome científico (itálico)
- Grupo taxonômico
- Observações
- Rank
- Link para a Wikipedia

---

## 🧱 Arquitetura do Projeto

Estrutura organizada por responsabilidades:

```
lib/
├── main.dart
├── models/
│   └── animal_model.dart
├── pages/
│   ├── home_page.dart
│   ├── scan_page.dart
│   ├── result_page.dart
│   ├── pokedex_page.dart
│   └── animal_detail_page.dart
├── widgets/
│   └── animal_card.dart
├── services/
│   └── pokedex_storage.dart
```

---

## 🧬 Modelo de Dados

### AnimalModel

Campos principais:
- id
- Nome científico
- Nome popular
- Imagem
- Grupo taxonômico
- Rank
- Observações
- Link da Wikipedia

Possui métodos para conversão **JSON ⇄ Objeto**, facilitando a persistência local.

---

## 💾 Persistência de Dados

- Armazenamento local dos animais capturados
- Funciona offline após salvar os dados
- Ideal para estudo de armazenamento local em Flutter

---

## 🚀 Tecnologias Utilizadas

- **Flutter**
- **Dart**
- **Material Design**
- Navegação com `Navigator.push`
- Armazenamento local

---

## ▶️ Como rodar o projeto

### Pré-requisitos
- Flutter SDK instalado
- Android Studio ou VS Code
- Emulador Android ou dispositivo físico

### Passos

```bash
git clone https://github.com/seu-usuario/animaldex.git
cd animaldex
flutter pub get
flutter run
```

---

## 📌 Status do Projeto

✅ Funcional
✅ Persistência local
✅ Fluxo completo de navegação
🚧 Scan real com câmera (futuro)
🚧 Integração com API real (futuro)

---

## 🔮 Próximas Melhorias

- 📸 Escaneamento real usando câmera
- 🌎 Integração com API iNaturalist
- ⭐ Sistema de raridade
- 🏆 Conquistas do usuário
- ☁️ Sincronização em nuvem

---

## 👨‍💻 Autor

**Gabriel Augusto**  
Projeto desenvolvido para estudo, portfólio e prática com Flutter.

---

## 📜 Licença

Projeto de uso educacional e pessoal.