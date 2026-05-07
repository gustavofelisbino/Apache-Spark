# Apache Spark com Delta Lake e Apache Iceberg

**Trabalho de Pesquisa — Arquitetura de Dados**  
Grupo: **Gustavo Dias** e **Lucas Oliverio**

---

## 📋 Sobre o Projeto

Este repositório contém a implementação prática de um ambiente **Apache Spark (PySpark)** com duas tecnologias de tabelas abertas (*open table formats*): **Delta Lake** e **Apache Iceberg**. O objetivo é demonstrar operações transacionais (INSERT, UPDATE, DELETE) sobre um dataset de vendas de e-commerce.

---

## ✅ Pré-requisitos

Antes de começar, certifique-se de ter instalado:

| Ferramenta | Versão mínima | Download |
|---|---|---|
| **Java (JDK)** | 11 ou 17 | [adoptium.net](https://adoptium.net/) |
| **Python** | 3.11+ | [python.org](https://www.python.org/) |
| **UV** | 0.4+ | [docs.astral.sh/uv](https://docs.astral.sh/uv/) |

### Instalando o UV

```bash
# Windows (PowerShell)
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# Linux / macOS
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Verificando o Java

O PySpark requer o **Java** instalado e a variável `JAVA_HOME` configurada.

```bash
java -version
# Esperado: openjdk version "11.x.x" ou "17.x.x"
```

> **Windows**: Configure o `JAVA_HOME` nas variáveis de ambiente do sistema apontando para o diretório de instalação do JDK (ex: `C:\Program Files\Eclipse Adoptium\jdk-17.x.x`).

---

## 🚀 Configurando o Ambiente

### 1. Clone o repositório

```bash
git clone https://github.com/gustavofelisbino/Apache-Spark.git
cd Apache-Spark
```

### 2. Crie e ative o ambiente virtual com UV

```bash
# Criar o ambiente virtual e instalar todas as dependências
uv sync
```

O UV lerá o `pyproject.toml` e instalará automaticamente:
- `pyspark==3.5.3`
- `delta-spark==3.2.0`
- `jupyterlab>=4.2.0`
- `pandas>=2.2.0`
- `pyarrow>=15.0.0`
- `mkdocs-material>=9.5.0`

### 3. Ative o ambiente virtual

```bash
# Windows
.venv\Scripts\activate

# Linux / macOS
source .venv/bin/activate
```

---

## 💻 Executando os Notebooks

### Inicie o JupyterLab

```bash
uv run jupyter lab
```

No Windows, prefira iniciar pelo script abaixo. Ele configura `JAVA_HOME` e `HADOOP_HOME` antes de abrir o JupyterLab:

```powershell
.\start_jupyter.ps1
```

O JupyterLab abrirá automaticamente no navegador em `http://localhost:8888`.

### Notebooks disponíveis

| Arquivo | Descrição |
|---|---|
| `delta_lake.ipynb` | Operações com Delta Lake: criação de tabela, INSERT, UPDATE, DELETE, Time Travel |
| `iceberg.ipynb` | Operações com Apache Iceberg: criação de tabela, INSERT, UPDATE, DELETE, Snapshots |

> **Dica:** Execute as células em ordem (`Shift + Enter`). A primeira célula de cada notebook pode demorar um pouco pois o Spark precisa inicializar.

---

## 📁 Estrutura do Repositório

```
Apache-Spark/
├── pyproject.toml          # Gerenciamento de dependências (UV)
├── README.md               # Este arquivo
├── delta_lake.ipynb        # Notebook — Delta Lake
├── iceberg.ipynb           # Notebook — Apache Iceberg
├── mkdocs.yml              # Configuração do MkDocs
├── docs/                   # Documentação MkDocs
│   ├── index.md            # Contextualização do trabalho
│   ├── spark.md            # Apache Spark / PySpark
│   ├── delta_lake.md       # Delta Lake
│   └── iceberg.md          # Apache Iceberg
├── delta-warehouse/        # Gerado ao executar o notebook Delta Lake
└── iceberg-warehouse/      # Gerado ao executar o notebook Iceberg
```

---

## 📄 Documentação (MkDocs)

A documentação completa está publicada em:  
🔗 **https://gustavofelisbino.github.io/Apache-Spark/**

### Executando a documentação localmente

```bash
uv run mkdocs serve
```

Acesse `http://127.0.0.1:8000` para visualizar o site localmente.

### Publicando no GitHub Pages

```bash
uv run mkdocs gh-deploy
```

---

## 🔧 Versões das Dependências Principais

| Biblioteca | Versão |
|---|---|
| Python | 3.11+ |
| PySpark | 3.5.3 |
| Delta Spark | 3.2.0 |
| JupyterLab | 4.2+ |
| Pandas | 2.2+ |
| PyArrow | 15.0+ |
| MkDocs Material | 9.5+ |

---

## 📚 Referências

- [Documentação oficial do Apache Spark](https://spark.apache.org/docs/latest/)
- [Documentação do Delta Lake](https://docs.delta.io/latest/index.html)
- [Documentação do Apache Iceberg](https://iceberg.apache.org/docs/latest/)
- [Canal DataWay BR — YouTube](https://www.youtube.com/@DataWayBR)
- [spark-delta — GitHub](https://github.com/jlsilva01/spark-delta)
- [spark-iceberg — GitHub](https://github.com/jlsilva01/spark-iceberg)
