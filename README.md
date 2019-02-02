# Modelo de Tese em LaTeX Não Oficial do Instituto Superior Técnico

Modelo de tese de mestrado em LaTeX não oficial para documentos escritos para o Instituto Superior Técnico. Este projeto tem como objetivo criar uma classe de LaTeX que define todas as restrições definidas pelo Instituto Superior Técnico por defeito quando incluída e implementa funções adicionais para definir pormenores do documento e permitir um certo nível de personalização dentro das restrições possíveis.

## Utilização

Para compilar um documento em LaTeX com esta classe, só é necessário fazer download do ficheiro [`ist-thesis.cls`](ist-thesis.cls).
1. Colocar o ficheiro `ist-thesis.cls` na mesma pasta que o documento `.tex` a compilar;
2. Incluir a linha abaixo no início do ficheiro;
````tex
\documentclass{ist-thesis}
````
   - Opções podem ser incluídas entre parênteses retos entre `\documentclass` e `{ist-thesis}`, como no exemplo seguinte. As opções utilizáveis encontrar-se-ão na documentação quando esta for disponibilizada.
````tex
\documentclass[english]{ist-thesis}
````
3. Compilar o documento.

### Compilação

Qualquer documento que utilize esta classe pode ser compilado da mesma maneira que a maior parte dos documentos LaTeX, sem configurações adicionais. Num serviço como o [Overleaf](https://www.overleaf.com/ "Overleaf"), basta fazer upload da classe e compilar. Para uma instalação local, basta correr o compilador através do editor de eleição ou através de `pdflatex doc.tex` ou `xelatex doc.tex` na linha de comandos, onde `doc.tex` é o documento a ser compilado.

### Logótipos

Os logótipos oficiais do Instituto Superior Técnico não estão incluídos neste repositório, mas podem ser encontrados na [página oficial](https://tecnico.ulisboa.pt/pt/sobre-o-tecnico/institucional/logo-e-manual-de-identidade/). A utilização destes logótipos é obrigatória e o repositório tem _placeholders_, ficheiros com nome, tamanho e estrutura iguais aos logótipos oficiais, colocados no sítio certo para serem substituídos pelos ficheiros corretos.

## Documentação

A documentação que irá ser disponibilizada irá incluir detalhes sobre o conteúdo da classe e como melhor fazer uso das funções incluídas.

Irá ser também incluído um exemplo de uma tese com formato *lorem ipsum* para exemplificar algumas das funções da classe em si e também algumas (na minha opinião) boas práticas na escrita de documentos em LaTeX.

## Erros, Problemas e Sugestões

Problemas com utilização da classe podem ser reportados aqui mesmo no GitHub. Contribuições em qualquer aspeto do projeto são bem-vindas!

## Referências

Regulamentos do relatório retirados do [Guia de Preparação da Dissertação](https://academica.tecnico.ulisboa.pt/files/sites/54/guia-de-preparacao-da-dissertacao-1516.pdf "Guia de Preparação da Dissertação") da Direção Académica do Instituto Superior Técnico.

A lista completa de recursos será disponibilizada na documentação.

## Licença

Este projeto está licenciado através da [LaTeX Project Public License](https://www.latex-project.org/lppl/), versão 1.3c.
