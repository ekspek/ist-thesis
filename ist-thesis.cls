  %% ist-thesis.cls
  %% Copyright 2019 Daniel de Schiffart
  %
  % This work may be distributed and/or modified under the
  % conditions of the LaTeX Project Public License, either version 1.3
  % of this license or (at your option) any later version.
  % The latest version of this license is in
  %   http://www.latex-project.org/lppl.txt
  % and version 1.3 or later is part of all distributions of LaTeX
  % version 2005/12/01 or later.
  %
  % This work has the LPPL maintenance status `maintained'.
  %
  % The Current Maintainer of this work is Daniel de Schiffart.
  %
  % This work consists of the file ist-thesis.cls.
  %
  % The most recent version of this work, along with
  % documentation and examples, can be found online
  % at https://github.com/ekspek/ist-thesis

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-thesis}[2019/02/02 v0.2.0 Unofficial IST thesis class]

\RequirePackage{etoolbox}
\RequirePackage{ifluatex}
\RequirePackage{ifxetex}
\RequirePackage{ifpdf}

\newbool{@portuguese}
\newbool{@english}
\newbool{@origmath}
\newbool{@bw}

\DeclareOption{portuguese}	{\booltrue{@portuguese}}
\DeclareOption{english}		{\booltrue{@english}}
\DeclareOption{origmath}	{\booltrue{@origmath}}
\DeclareOption{bw}			{\booltrue{@bw}}

\PassOptionsToClass{twoside}{report}
\ExecuteOptions{portuguese}
\ProcessOptions\relax

\LoadClass{report}

% - Unicode boolean for either XeTeX or LuaTeX - %
\newbool{unicode}
\ifbool{xetex}{
	\booltrue{unicode}
}{
	\ifbool{luatex}
		{ \booltrue{unicode} }
		{ \boolfalse{unicode} }
}

\ifbool{@english}{\boolfalse{@portuguese}}

\RequirePackage{mathtools}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{geometry}

\ifbool{unicode}{
	\RequirePackage[no-math]{fontspec}
	\setmainfont[
		UprightFont = *-regular,
		Extension = .otf,
		BoldFont = *-bold,
		ItalicFont = *-italic,
		BoldItalicFont = *-bolditalic]{texgyreheros}
	\setmonofont[Scale = 1.14]{inconsolata}

	% - Language Settings - %
	\RequirePackage{polyglossia}
	\ifbool{@portuguese}{
		\setmainlanguage{portuges}
		\setotherlanguage[variant = british]{english}
	}{
		\setmainlanguage[variant = british]{english}
		\setotherlanguage{portuges}
	}
}{
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T1]{fontenc}
	\RequirePackage{tgheros}
	\renewcommand{\familydefault}{\sfdefault}
	\RequirePackage[scaled = 1.14]{inconsolata}

	% - Language Settings - %
	\ifbool{@portuguese}
		{ \PassOptionsToPackage{english, main = portuguese}{babel} }
		{ \PassOptionsToPackage{portuguese, main = english}{babel} }

	\RequirePackage{babel}
}
\notbool{@origmath}{\RequirePackage{newtxsf}}{}

\RequirePackage{microtype}
\RequirePackage{caption}
\RequirePackage{subcaption}

\geometry{a4paper,margin = 2.5cm}
\renewcommand\baselinestretch{1.5}

\ifbool{@bw}{
	\definecolor{ist-cyan}{cmyk}{1,1,1,1}
	\definecolor{ist-gray}{cmyk}{1,1,1,1}
}{
	\definecolor{ist-cyan}{cmyk}{1,0,0,0}
	\definecolor{ist-gray}{cmyk}{0.2,0,0,0.8}
}

\hypersetup{colorlinks,
	linkcolor	= {ist-cyan},
	citecolor	= {ist-cyan},
	urlcolor	= {ist-cyan}
}

\notbool{@bw}{
	\preto\tableofcontents{\hypersetup{linkcolor = {black}}}
	\appto\tableofcontents{\hypersetup{linkcolor = {ist-cyan}}}
}

% - Class Commands - %
\newrobustcmd*\tsubtitle{}
\newrobustcmd*\tsupervisor{Prof. Lorem Ipsum}
\newrobustcmd*\tchairperson{Prof. Lorem Ipsum}
\newrobustcmd*\tcommittee{Prof. Lorem Ipsum}
\newrobustcmd*\tdate{\today}
\newrobustcmd*\tinstitution{Instituto Superior Técnico}

\ifbool{@english}{
	\newrobustcmd*\ttitle{Thesis Title}
	\newrobustcmd*\tauthor{Thesis Author}
	\newrobustcmd*\tdegree{Something Engineering}
}{
	\newrobustcmd*\ttitle{Título da Dissertação}
	\newrobustcmd*\tauthor{Autor da Dissertação}
	\newrobustcmd*\tdegree{Engenharia de Qualquer Coisa}
}

\newrobustcmd*\settitle[1]{\renewcommand\ttitle{#1}}
\newrobustcmd*\setsubtitle[1]{\renewcommand\tsubtitle{#1}}
\newrobustcmd*\setauthor[1]{\renewcommand\tauthor{#1}}
\newrobustcmd*\setdegree[1]{\renewcommand\tdegree{#1}}
\newrobustcmd*\setinstitution[1]{\renewcommand\tinstitution{#1}}
\newrobustcmd*\setdate[1]{\renewcommand\tdate{#1}}
\newrobustcmd*\setsupervisor[1]{\renewcommand\tsupervisor{#1}}
\newrobustcmd*\setchairperson[1]{\renewcommand\tchairperson{#1}}
\newrobustcmd*\setcommittee[1]{\renewcommand\tcommittee{#1}}

\newrobustcmd{\makecover}{
	\pagenumbering{roman}
	\setcounter{page}{0}
	\begin{titlepage}
	\includegraphics[viewport=9.5cm 11cm 0cm 0cm,scale=0.29]{IST_A_CMYK_POS}
	\begin{center}
		\vspace*{17mm}
		\includegraphics[width=0.5\linewidth]{example-image}
		\par\vspace{\fill}
		{\LARGE\bfseries \ttitle}
		\par\vspace{10mm}
		{\Large \tsubtitle}
		\par\vspace{10mm}
		{\Large\bfseries \tauthor}
		\par\vspace{10mm}
		\ifbool{@english}
			{\large Thesis to obtain the Master of Science Degree in}
			{\large Dissertação para obtenção do Grau de Mestre em}
		\par\medskip
		{\LARGE\bfseries \tdegree}
		\par\vspace{10mm}
		{\large \ifbool{@english}{Supervisor:}{Orientador:} \tsupervisor}
		\par\vspace{7mm}
		{\large\bfseries \ifbool{@english}{Examination Committee}{Júri}}
		\par\vspace{3mm}{\large
			\renewcommand\arraystretch{0.9}
			\begin{tabular}{r l}
				\ifbool{@english}
					{Chairperson:}{Presidente:}				& \tchairperson{}		\\
				\ifbool{@english}
					{Supervisor:}{Orientador:}				& \tsupervisor{}		\\
				\ifbool{@english}
					{Members of the Committee:}{Vogais:}	& \tcommittee{}
			\end{tabular}
		}
		\par\vspace{10mm}
		{\large\bfseries \tdate{}}
	\end{center}
	\cleardoublepage
	\end{titlepage}
}

\newenvironment{dedication}{
	\newpage
	\vspace*{40mm}
	\renewcommand\baselinestretch{1.1}
	\itshape
	\begin{flushright}
}{
	\end{flushright}
	\cleardoublepage
}

\newenvironment{acknowledgements}{
	\newpage
	\vspace*{30mm}
	\ifbool{@english}
		{ \section*{Acknowledgements} }
		{ \section*{Agradecimentos} }
	\par
}{
	\cleardoublepage
}

\newenvironment{tabstract}[1]{
	\newpage
	\newcommand*\ackkey[1]{#1}
	\vspace*{60mm}
	\begin{center}
		\ifbool{@english}
			{ \section*{Abstract} }
			{ \section*{Resumo} }
		\end{center}
}{
	\par\vspace{\fill}
	\ifbool{@english}
		{ {\large \textbf{Keywords:} \ackkey{}} }
		{ {\large \textbf{Palavras-Chave:} \ackkey{}} }
	\cleardoublepage
}

\newrobustcmd\mainstart{\cleardoublepage\pagenumbering{arabic}}
