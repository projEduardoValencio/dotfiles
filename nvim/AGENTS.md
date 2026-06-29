# AGENTS.md

## Objetivo

Este repositorio contem uma configuracao enxuta de NeoVim. Sempre que houver mudancas em plugins, LSPs, atalhos que dependam de ferramentas externas, ou requisitos do ambiente, a documentacao deve ser atualizada no mesmo trabalho.

## Regra principal

Ao adicionar, remover ou alterar qualquer plugin, dependencia externa, integracao de LSP, ou requisito de sistema, atualize obrigatoriamente estes arquivos:

- [docs/dependencias.md](/Users/eduardo/.config/nvim/docs/dependencias.md)
- [docs/instalacao-dependencias.md](/Users/eduardo/.config/nvim/docs/instalacao-dependencias.md)

## Quando atualizar `docs/dependencias.md`

Atualize este arquivo quando houver qualquer mudanca em:

- plugins instalados
- dependencias de sistema como `git`, `node`, `npm`, `ripgrep`, `clangd`, `curl`, `wget`, `tar`, `unzip`, `fd`
- LSPs instalados via Mason ou configurados manualmente
- dependencias opcionais que passem a ser recomendadas

O formato preferido deve continuar sendo:
- dependencia
- plugins e LSPs que precisam dela
- breve motivo

## Quando atualizar `docs/instalacao-dependencias.md`

Atualize este arquivo quando houver qualquer mudanca em:

- passos de instalacao para Windows
- passos de instalacao para Linux
- cuidados de versao do NeoVim, Node.js, clangd ou outras ferramentas
- comandos de validacao
- troubleshooting relevante para o setup atual

## Expectativa de manutencao

Nao deixe para documentar depois. A documentacao faz parte da entrega.

Toda alteracao que mude comportamento, requisitos ou dependencias do setup deve sair com:

1. codigo/configuracao atualizados
2. `docs/dependencias.md` atualizado
3. `docs/instalacao-dependencias.md` atualizado

## Escopo

Estas instrucoes valem especialmente para mudancas em:

- `init.lua`
- `lua/config/*.lua`
- `lua/plugins/*.lua`

## Preferencias

- manter a configuracao leve
- evitar adicionar dependencias externas sem necessidade clara
- se uma nova dependencia for introduzida, documentar impacto e instalacao
