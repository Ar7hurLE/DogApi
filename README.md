# 🐾 Automação de Testes - Dog API

**API:** [https://dog.ceo/dog-api/documentation](https://dog.ceo/dog-api/documentation)

---

## 🎯 Cenários testados

| Cenário | Descrição |
|---------|-----------|
| 📃 Listagem completa de raças caninas | Valida que o endpoint retorna todas as raças corretamente |
| 🖼 Listagem de imagens por raça | Retorna imagens da raça escolhida (ex.: basenji) |
| 🐕 Imagem aleatória por raça | Retorna uma imagem aleatória de uma raça específica (ex.: hound) |
| 🔀 Imagem aleatória por lista de raças | Retorna uma imagem aleatória de qualquer raça da lista `@{BREEDS}` |
| ❌ Cenário de erro: raça inexistente | Valida que o endpoint retorna vazio para raças inexistentes (ex.: xxx, yyy) |

---

## Execução Local

Para rodar os testes:

```bash
git clone https://github.com/Ar7hurLE/DogApi.git
cd DogApi
robot -d results DogApiTests/tests
```
## É possivel visualizar também os resultados de execucões anteriores na aba Actions do GitHub! :)
