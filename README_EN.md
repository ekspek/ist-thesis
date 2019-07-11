# Unofficial LaTeX Thesis Template for IST Lisbon

Master degree thesis template tailored for Instituto Superior Técnico. This project aims to develop a LaTeX class which implements all restrictions defined by IST when included, as well as provide additional functions to define some document details and allow a certain level of personalization, within the given restrictions.

## Use

To compile a LaTeX document with this class, it is only needed to download the file [`ist-thesis.cls`](https://github.com/ekspek/ist-thesis/releases/download/v1.1.0/ist-thesis.cls).
1. Place the file `ist-thesis.cls` in the same directory as the `.tex` file you wish to compile;
2. Include the following line in the beginning of the file;
```tex
\documentclass{ist-thesis}
```
   - Options may be included between `[]`, as the next example shows. The available options will be listed in the documentation, when this is finished.
```tex
\documentclass[english]{ist-thesis}
```

3. Compile the document.

### Compiling

A document that uses this class can be compiled much the same way as most LaTeX documents, without extra configuration. On a service like [Overleaf](https://www.overleaf.com/"Overleaf"), it is enough to upload the class file and hip compile. For a local setup, it is enough to run the LaTeX compiler from your editor, or by the shell commands `pdflatex <your-file.tex>` or `xelatex <your-file.tex>`.

However, with a bibliography (references) or glossary, caution is needed. See help for these issues in the documentation.

### Logos

The official logos for IST are included on this repository, but can also be found at [the official page](https://tecnico.ulisboa.pt/pt/sobre-o-tecnico/institucional/logo-e-manual-de-identidade/). The use of these logos is mandatory, and the class will return an error for missing files.

## Documentation

This project documentation includes details about the contents of the class file and how to better use its functions. It can be found in this [link](doc/doc.pdf) or in the [doc](doc/) directory, accompanied by its own source code.

It is also included a thesis example in *lorem ipsum* format to showcase some of the class functions, and also some (in my opinion) good practices in writing LaTeX documents. This is found in the root directory of this repository, or in this [link](thesis.pdf).

In the future there may be a document which helps the creation of a thesis, separated from the official documentation, to help with some LaTeX aspects.

## Errors, Problems and Suggestions

Problems with the class use can be reported here on GitHub, or by contacting me or any of the contributors directly. Any contributions to this project are welcome!

Errors, milestones and other discussion can be added on GitHub's [Issues](https://github.com/ekspek/ist-thesis/issues) page.

## References

The regulations for the writting of a thesis were obtained from [Guia de Preparação da Dissertação](https://academica.tecnico.ulisboa.pt/files/sites/54/guia-de-preparacao-da-dissertacao-1516.pdf "Guia de Preparação da Dissertação") (Guide for preparing a dissertation) from the *Direção Académica do Instituto Superior Técnico* (Academic board for IST).

## License

This project is licensed through the [LaTeX Project Public License](https://www.latex-project.org/lppl/), version 1.3c.

Any data relevant to the Instituto Superior Técnico (with special consideration for the university logos) is property of the Instituto Superior Técnico and the University of Lisbon.
