# Dependencias do Setup

Este documento lista as dependencias externas do ambiente e quais plugins ou LSPs do setup dependem delas.

## Sem dependencias externas obrigatorias

- `folke/which-key.nvim`
- `nvim-lua/plenary.nvim`
- `nvim-tree/nvim-web-devicons`
- `L3MON4D3/LuaSnip`
- `preservim/nerdtree`
- `neovim/nvim-lspconfig`
- `williamboman/mason-lspconfig.nvim`
- `folke/flash.nvim`
- `stevearc/oil.nvim`
- `MeanderingProgrammer/render-markdown.nvim`

Observacao:
- Os itens acima ainda dependem do proprio NeoVim funcionando corretamente.
- `nvim-lspconfig` nao instala servidores sozinho. Ele apenas integra os LSPs ao NeoVim.

## `git`

Usado por:
- `folke/lazy.nvim`
- `williamboman/mason.nvim`
- `Xuyuanp/nerdtree-git-plugin`

Motivo:
- baixar e atualizar plugins
- consultar estado do repositorio no NERDTree

## `curl` ou `wget`

Usado por:
- `williamboman/mason.nvim`

Motivo:
- baixar binarios, pacotes e artefatos de LSPs e ferramentas instaladas pelo Mason

## `unzip`

Usado por:
- `williamboman/mason.nvim`

Motivo:
- extrair pacotes distribuidos em `.zip`

## `tar`

Usado por:
- `williamboman/mason.nvim`

Motivo:
- extrair pacotes distribuidos em formatos como `.tar.gz`

## `node` e `npm`

Usado por:
- LSP `pyright`

Motivo:
- `pyright` pertence ao ecossistema Node.js

Observacao:
- Mesmo usando Mason, manter `node` e `npm` instalados evita falhas de ambiente em varios servidores do ecossistema JavaScript/TypeScript.

## `clangd`

Usado por:
- LSP `clangd`

Motivo:
- fornecer LSP para C

Observacao:
- normalmente vem do pacote LLVM ou do pacote especifico `clangd`

## `ripgrep` (`rg`)

Usado por:
- `nvim-telescope/telescope.nvim`
- `epwalsh/obsidian.nvim`

Motivo:
- habilitar `live_grep` para busca de texto no projeto
- habilitar busca e quick switch do Obsidian via Telescope

Observacao:
- `find_files` pode funcionar sem `rg`, mas a experiencia de busca por conteudo depende dele.

## Dependencias opcionais uteis

### `fd`

Usado por:
- `nvim-telescope/telescope.nvim`

Motivo:
- acelerar a busca de arquivos

Observacao:
- nao e obrigatorio, mas melhora a performance e a experiencia do `find_files`

### Nerd Font no terminal

Usado por:
- `nvim-tree/nvim-web-devicons`
- `stevearc/oil.nvim`

Motivo:
- exibir icones corretamente no explorador de arquivos e em outras UIs que consumam devicons

Observacao:
- sem uma Nerd Font configurada no terminal, os icones podem aparecer como quadrados, caracteres estranhos ou simplesmente nao aparecer

## Versoes e contexto do setup

Ambiente atual observado:
- NeoVim `0.12.3`

Plugins/LSPs configurados que dependem do ambiente:
- `lua_ls`
- `marksman`
- `pyright`
- `clangd`
- `nvim-tree/nvim-web-devicons`
- `MeanderingProgrammer/render-markdown.nvim`
- `epwalsh/obsidian.nvim`

Observacoes importantes:
- O setup de LSP foi adaptado para a API moderna `vim.lsp.config()` e `vim.lsp.enable()`
- `render-markdown.nvim` foi configurado em modo conservador, usando o Treesitter nativo do NeoVim e com `code`, `html`, `latex`, `yaml` e `injections` desativados para evitar incompatibilidades no NeoVim `0.12.3`
- `obsidian.nvim` so e ativado quando a pasta `~/Documents/ObsidianVault` existir
