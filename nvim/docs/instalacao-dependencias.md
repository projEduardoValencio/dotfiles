# Instalacao das Dependencias

Este documento mostra como preparar o sistema para que o setup do NeoVim funcione corretamente no Windows e no Linux.

## Requisitos principais

Itens recomendados para o setup completo:
- NeoVim `0.11+`
- `git`
- `curl` ou `wget`
- `unzip`
- `tar`
- `ripgrep`
- `node`
- `npm`
- `clangd`

Itens opcionais:
- `fd`
- Nerd Font no terminal

Recomendacao pratica:
- prefira NeoVim `0.12+`
- prefira Node.js LTS atual
- garanta que todos os comandos estejam disponiveis no `PATH`

## O que cada dependencia habilita

- `git`: instalacao e atualizacao de plugins, integracao Git no NERDTree
- `curl` ou `wget`: downloads feitos pelo Mason
- `unzip` e `tar`: extracao de artefatos baixados pelo Mason
- `ripgrep`: busca por texto no Telescope com `live_grep`
- `node` e `npm`: suporte ao LSP `pyright`
- `clangd`: suporte ao LSP de C
- `fd`: melhora a busca de arquivos no Telescope
- Nerd Font: exibe icones corretamente no `oil.nvim` e em plugins que usam devicons

## Cuidados de versao

### NeoVim

Use:
- minimo recomendado: `0.11`
- preferivel: `0.12+`

Motivo:
- o setup de LSP usa a API moderna do NeoVim
- versoes mais antigas podem quebrar com `nvim-lspconfig` recente

### Node.js

Use:
- preferencialmente uma versao LTS atual

Motivo:
- evita incompatibilidades com ferramentas do ecossistema Node
- ajuda no funcionamento do `pyright`
- ajuda no funcionamento do `markdown-preview.nvim`

### clangd

Use:
- uma versao recente do LLVM/clangd

Motivo:
- reduz risco de comportamento antigo no LSP de C

## Windows

### Nerd Font

Recomendacoes:
- `JetBrainsMono Nerd Font`
- `FiraCode Nerd Font`
- `Hack Nerd Font`

Depois de instalar:
- configure essa fonte no Windows Terminal, WezTerm, Alacritty ou terminal que voce usa

### Opcao 1: winget

Instale os pacotes principais:

```powershell
winget install Neovim.Neovim
winget install Git.Git
winget install BurntSushi.ripgrep.MSVC
winget install OpenJS.NodeJS.LTS
winget install LLVM.LLVM
```

Opcional:

```powershell
winget install sharkdp.fd
```

Observacoes:
- `tar` costuma existir no Windows moderno
- `curl` tambem costuma vir disponivel
- `unzip` normalmente nao precisa de instalacao separada se o fluxo usar ferramentas nativas, mas pode variar conforme o pacote instalado pelo Mason

### Opcao 2: Chocolatey

```powershell
choco install neovim git ripgrep nodejs-lts llvm -y
choco install fd -y
```

### Validacao no Windows

Depois da instalacao, teste:

```powershell
nvim --version
git --version
rg --version
node --version
npm --version
clangd --version
```

Se instalar `fd`:

```powershell
fd --version
```

## Linux

### Nerd Font

Recomendacoes:
- `JetBrainsMono Nerd Font`
- `FiraCode Nerd Font`
- `Hack Nerd Font`

Depois de instalar:
- configure essa fonte no terminal ou emulador que voce usa

As instrucoes abaixo cobrem os cenarios mais comuns. Ajuste conforme sua distribuicao.

### Ubuntu / Debian

```bash
sudo apt update
sudo apt install -y neovim git curl wget unzip tar ripgrep nodejs npm clangd fd-find
```

Observacoes:
- em Debian/Ubuntu o binario do `fd` pode se chamar `fdfind`
- se quiser usar `fd` com esse nome no Telescope, pode criar alias manual no shell

Validacao:

```bash
nvim --version
git --version
rg --version
node --version
npm --version
clangd --version
fdfind --version
```

### Fedora

```bash
sudo dnf install -y neovim git curl wget unzip tar ripgrep nodejs npm clang-tools-extra fd-find
```

Se `fd-find` nao existir no repositorio da sua versao:

```bash
sudo dnf install -y fd-find || sudo dnf install -y fd
```

Validacao:

```bash
nvim --version
git --version
rg --version
node --version
npm --version
clangd --version
fd --version
```

### Arch Linux

```bash
sudo pacman -Syu --noconfirm neovim git curl wget unzip tar ripgrep nodejs npm clangd fd
```

Validacao:

```bash
nvim --version
git --version
rg --version
node --version
npm --version
clangd --version
fd --version
```

## Depois de instalar as dependencias

Abra o NeoVim:

```bash
nvim
```

Dentro do NeoVim, execute:

```vim
:Lazy sync
```

Depois:

```vim
:Mason
```

Confirme se os LSPs abaixo estao instalados:
- `clangd`
- `lua_ls`
- `marksman`
- `pyright`

Se for usar Obsidian, ajuste o workspace padrao em [lua/plugins/obsidian.lua](/Users/eduardo/.config/nvim/lua/plugins/obsidian.lua) caso seu vault nao fique em `~/Documents/ObsidianVault`. Se essa pasta nao existir, o plugin fica desativado e nao quebra a inicializacao.

## Checklist de verificacao

Se algo nao funcionar, revise:
- `nvim --version` mostra `0.11+`
- `git` esta no `PATH`
- `rg` esta no `PATH`
- `node` e `npm` estao no `PATH`
- `clangd` esta no `PATH`
- o terminal esta usando uma Nerd Font
- o comando `:checkhealth vim.lsp` nao mostra erro critico
- o comando `:checkhealth mason` nao mostra dependencias faltando

## Problemas comuns

### `pyright` nao sobe

Verifique:
- `node --version`
- `npm --version`
- `:Mason` para confirmar instalacao do `pyright`

### `live_grep` do Telescope nao funciona

Verifique:
- `rg --version`

### `RenderMarkdown` nao funciona

Verifique:
- `nvim --version`
- que seu NeoVim tenha suporte Treesitter nativo
- se o arquivo esta com `:set ft?` retornando `markdown`

Observacao:
- neste setup, `code`, `html`, `latex`, `yaml` e `injections` do `render-markdown.nvim` ficam desativados por compatibilidade, entao o foco e renderizacao do Markdown principal dentro do buffer

### Icones nao aparecem

Verifique:
- rode `:Lazy sync` para instalar `nvim-web-devicons`
- confirme que o terminal esta usando uma Nerd Font
- reinicie o terminal depois de trocar a fonte

### Comandos do Obsidian nao encontram notas

Verifique:
- se o vault existe em `~/Documents/ObsidianVault`
- ou ajuste o caminho em [lua/plugins/obsidian.lua](/Users/eduardo/.config/nvim/lua/plugins/obsidian.lua)
- `rg --version`

### LSP de C nao anexa

Verifique:
- `clangd --version`
- se o projeto tem estrutura reconhecivel para root

### Mason falha ao instalar binarios

Verifique:
- `git`
- `curl` ou `wget`
- `unzip`
- `tar`

## Observacao final

Este setup foi mantido propositalmente enxuto. Se futuramente voce adicionar novos plugins, vale atualizar [dependencias.md](/Users/eduardo/.config/nvim/docs/dependencias.md) junto com este documento.
