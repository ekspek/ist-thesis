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
\ProvidesClass{ist-thesis}[2019/07/11 v1.1.0 Unofficial IST thesis class]

\typeout{_____________________________________________________________________________}
\typeout{_____________________________________________________________________________}
\typeout{__________________`:::::::::::::::::::::::::::::::::::::::`__________________}
\typeout{__________________.ooooooooooooooooooooooooooooooooooooooo`__________________}
\typeout{__________________.oooooooooooooooooooo/://:/+oooooooooooo`__________________}
\typeout{__________________.oooooooooooooooooo-`_:oo-_`-ooooooooooo`__________________}
\typeout{__________________.ooooooooooooooooo/___+oo+___+oooooooooo`__________________}
\typeout{__________________.ooooooooooooooooo/___+ooo+/+ooooooooooo`__________________}
\typeout{__________________.oooooooooo+///ooo/___+o///////ooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+o.`___`.ooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+o+/___/+ooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+oo/___/oooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+oo/___/oooooooooo`__________________}
\typeout{__________________`oooooooooo:___+oo/___+oo/___/oooooooooo___________________}
\typeout{___________________+ooooooooo:___+oo/___+oo/___/ooooooooo+___________________}
\typeout{___________________-ooooooooo:___+oo/___+oo/___/ooooooooo-___________________}
\typeout{____________________+oooooooo+///ooo/___+ooo///ooooooooo/____________________}
\typeout{____________________.ooooooooo//+ooo/___+oooooooooooooo+`____________________}
\typeout{_____________________.+oooooo/__`ooo/___+ooooooooooooo+`_____________________}
\typeout{______________________`+ooooo+.`_/o+-_`:ooooooooooooo/`______________________}
\typeout{_______________________`:oooooo+/:////oooooooooooooo:________________________}
\typeout{_________________________.+ooooooooooooooooooooooo/`_________________________}
\typeout{___________________________-+ooooooooooooooooooo/.___________________________}
\typeout{_____________________________./ooooooooooooooo/._____________________________}
\typeout{_______________________________`:+ooooooooo+-`_______________________________}
\typeout{__________________________________.:+ooo+:.__________________________________}
\typeout{_____________________________________.-`_____________________________________}
\typeout{_____________________________________________________________________________}
\typeout{_____________________________________________________________________________}

% Packages loaded for class commands and engine checks
\RequirePackage{etoolbox}
\RequirePackage{ifluatex}
\RequirePackage{ifxetex}
\RequirePackage{ifpdf}

% Booleans for class options
\newbool{@portuguese}
\newbool{@english}
\newbool{@origmath}
\newbool{@bw}

% Bind the class option interface to the respective booleans
\DeclareOption{portuguese}	{\booltrue{@portuguese}\PassOptionsToClass{portuguese}{report}}
\DeclareOption{english}		{\booltrue{@english}\PassOptionsToClass{english}{report}}
\DeclareOption{origmath}	{\booltrue{@origmath}}
\DeclareOption{bw}			{\booltrue{@bw}}

% Use the basic LaTeX report class with the twoside option as base
% Portuguese is on by default
\PassOptionsToClass{twoside}{report}
\ExecuteOptions{portuguese}
\ProcessOptions\relax

\LoadClass{report}

% Unicode boolean for either XeTeX or LuaTeX
\newbool{unicode}
\ifbool{xetex}{
	\booltrue{unicode}
}{
	\ifbool{luatex}
		{ \booltrue{unicode} }
		{ \boolfalse{unicode} }
}

% Language sanity check (english option takes priority if chosen)
\ifbool{@english}{\boolfalse{@portuguese}}

\RequirePackage{mathtools}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{geometry}

% Font and language settings
% These settings are very engine dependent and need careful treatment
\ifbool{unicode}{
	% Font settings
	\RequirePackage[no-math]{fontspec}
	\IfFontExistsTF{texgyreheros-regular.otf}{
		\setsansfont[
			UprightFont = *-regular,
			Extension = .otf,
			BoldFont = *-bold,
			ItalicFont = *-italic,
			BoldItalicFont = *-bolditalic]{texgyreheros}
	}{}
	\renewcommand{\familydefault}{\sfdefault}
	\setmonofont[Scale = 1.14]{InconsolataN}
}{
	% Font settings
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T1]{fontenc}
	\RequirePackage{tgheros}
	\renewcommand{\familydefault}{\sfdefault}
	\RequirePackage[scaled = 1.14, narrow]{inconsolata}
}

% Language settings
\ifbool{@portuguese}
	{ \RequirePackage[main = portuguese, english]{babel} }
	{ \RequirePackage[main = english, portuguese]{babel} }

% Load the newtxsf math font (engine agnostic) if origmath isn't activated
\notbool{@origmath}{\RequirePackage{newtxsf}}{}

\RequirePackage{microtype}
\RequirePackage{tocbibind}
\RequirePackage{setspace}
\RequirePackage{caption}
\RequirePackage{totpages}

% Default IST regulations
\geometry{a4paper,margin = 2.5cm}
\setstretch{1.5}

% Caption definitions, not mandatory but look a bit better
\captionsetup{labelfont = bf, margin = 15pt}
\captionsetup[table]{position = top, skip = 3pt}

% Set the IST colors if the bw option is not chosen
\ifbool{@bw}{
	\definecolor{ist-cyan}{cmyk}{1,1,1,1}
	\definecolor{ist-gray}{cmyk}{1,1,1,1}
}{
	\definecolor{ist-cyan}{cmyk}{1,0,0,0}
	\definecolor{ist-gray}{cmyk}{0.2,0,0,0.8}
}

% Bind the defined colors to their hyperref targets
\hypersetup{colorlinks,
	linkcolor	= {ist-cyan},
	citecolor	= {ist-cyan},
	urlcolor	= {ist-cyan}
}

% Prevent the ToC from getting colors
\notbool{@bw}{
	\preto\tableofcontents{\begingroup\hypersetup{linkcolor = black}}
	\appto\tableofcontents{\endgroup}
	\preto\listoffigures{\begingroup\hypersetup{linkcolor = black}}
	\appto\listoffigures{\endgroup}
	\preto\listoftables{\begingroup\hypersetup{linkcolor = black}}
	\appto\listoftables{\endgroup}
}

% Define a warning if the document surpasses 100 pages (IST rules)
\def\maxPages{100}
\AfterEndDocument{
	\ifnumcomp{\theTotPages}{>}{\maxPages}{
		\ClassWarningNoLine{ist-thesis}{%
			Number of pages exceeds IST regulated maximum for\MessageBreak
			a dissertation (\theTotPages\space pages out of a maximum of \maxPages).\MessageBreak
			Remove content and compile again}
	}{}
}

% Define PDF metadata for PDF readers to use
\hypersetup{unicode = true}
\ifbool{unicode}
	{ \hypersetup{pdfcreator = {Xe/LuaLaTeX with the ist-thesis class}} }
	{ \hypersetup{pdfcreator = {pdfLaTeX with the ist-thesis class}} }
\ifbool{@english}
	{ \hypersetup{pdflang = {English}} }
	{ \hypersetup{pdflang = {Português}} }

% Defining class metadata variables for various purposes
\newrobustcmd*\tsubtitle{}
\newrobustcmd*\tsupervisor{Prof. Lorem Ipsum \tand Prof. Lorem Ipsum}
\newrobustcmd*\tchairperson{Prof. Lorem Ipsum}
\newrobustcmd*\tcommittee{Prof. Lorem Ipsum \tand Prof. Lorem Ipsum}
\newrobustcmd*\tinstitution{Instituto Superior Técnico}
\newrobustcmd*\tcoverimage{example-image}
\newrobustcmd*\tcoverimagewidth{0.5}
\newrobustcmd*\tand{\\ &}

% Default values for class metadata (language dependent)
\ifbool{@english}{
	\newrobustcmd*\ttitle{[Thesis Title]}
	\newrobustcmd*\tauthor{[Candidate Full Name]}
	\newrobustcmd*\tdegree{[Scientific Field]}
	\newrobustcmd*\tdate{[Month and Year]}
}{
	\newrobustcmd*\ttitle{[Título da Dissertação]}
	\newrobustcmd*\tauthor{[Nome Completo do(a) Candidato(a)]}
	\newrobustcmd*\tdegree{[Nome do Curso]}
	\newrobustcmd*\tdate{[Mês e Ano]}
}

% Define user commands to set the class metadata (and some PDF metadata entries too)
\newrobustcmd*\settitle[1]{\renewcommand\ttitle{#1}\hypersetup{pdftitle = {#1}}}
\newrobustcmd*\setsubtitle[1]{\renewcommand\tsubtitle{#1}\hypersetup{pdfsubject = {#1}}}
\newrobustcmd*\setauthor[1]{\renewcommand\tauthor{#1}\hypersetup{pdfauthor = {#1}}}
\newrobustcmd*\setdegree[1]{\renewcommand\tdegree{#1}}
\newrobustcmd*\setinstitution[1]{\renewcommand\tinstitution{#1}}
\newrobustcmd*\setdate[1]{\renewcommand\tdate{#1}}
\newrobustcmd*\setsupervisor[1]{\renewcommand\tsupervisor{#1}}
\newrobustcmd*\setchairperson[1]{\renewcommand\tchairperson{#1}}
\newrobustcmd*\setcommittee[1]{\renewcommand\tcommittee{#1}}
\newrobustcmd*\setcoverimage[2][0.5]{
	\renewcommand\tcoverimage{#2}
	\renewcommand\tcoverimagewidth{#1}
}

% Create the cover layout and attribute it to the makecover command
\newrobustcmd{\makecover}{
	\pagenumbering{roman}
	\setcounter{page}{0}
	\begin{titlepage}
	\includegraphics[viewport=9.5cm 11cm 0cm 0cm,scale=0.29]{IST_A_CMYK_POS}
	\begin{center}
		\vspace*{17mm}
		\includegraphics[width=\tcoverimagewidth\linewidth]{\tcoverimage}
		\par\vspace{\fill}
		{\LARGE\bfseries \ttitle}
		\par\vspace{10mm}
		{\Large \tsubtitle}
		\par\vspace{10mm}
		{\Large\bfseries
			\begin{tabular}{c c}
				&\tauthor
			\end{tabular}
		}
		\par\vspace{10mm}
		\ifbool{@english}
			{\large Thesis to obtain the Master of Science Degree in}
			{\large Dissertação para obtenção do Grau de Mestre em}
		\par\medskip
		{\LARGE\bfseries \tdegree}
		\par\vspace{10mm}
		{\large\renewcommand\arraystretch{0.9}
			\begin{tabular}{r l}
				\ifbool{@english}{Supervisor:}{Orientador:} & \tsupervisor
			\end{tabular}
		}
		\par\vspace{7mm}
		{\large\bfseries \ifbool{@english}{Examination Committee}{Júri}}
		\par\vspace{3mm}{\large\renewcommand\arraystretch{0.9}
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

% Define the dedication environment
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

% Define the acknowledgement environment
\newenvironment{acknowledgements}{
	\newpage
	\vspace*{30mm}
	\ifbool{@english}
		{ \section*{Acknowledgements} }
		{ \section*{Agradecimentos} }
}{
	\cleardoublepage
}

% Define the abstract environment with an optional keyword argument
% Defined as tabstract to prevent confusion with the report class abstract environment
\newenvironment{tabstract}[1]{
	\newpage
	\newcommand*\abskey[1]{#1}
	\vspace*{60mm}
	\begin{center}
		\ifbool{@english}
			{ \section*{Abstract} }
			{ \section*{Resumo} }
	\end{center}
}{
	\par\vspace{\fill}
	\ifbool{@english}
		{ {\noindent\large\textbf{Keywords:} \abskey{}} }
		{ {\noindent\large\textbf{Palavras-Chave:} \abskey{}} }
	\cleardoublepage
}

% Foreign language abstract environment
% Identical to tabstract except for the language definitions
\newenvironment{fabstract}[1]{
	\newpage
	\newcommand*\abskey[1]{#1}
	\vspace*{60mm}
	\ifbool{@english}{
		\begingroup
		\selectlanguage{portuguese}
		\begin{center}
			\section*{Resumo}
		\end{center}
	}{
		\begingroup
		\selectlanguage{english}
		\begin{center}
			\section*{Abstract}
		\end{center}
	}
}{
	\par\vspace{\fill}
	\ifbool{@english}{
		{\noindent\large\textbf{Palavras-Chave:} \abskey{}}
		\endgroup
		\selectlanguage{english}
	}{
		{\noindent\large\textbf{Keywords:} \abskey{}}
		\endgroup
		\selectlanguage{portuguese}
	}
	\cleardoublepage
}

% Define the mainstart command to start the main part of the text
% Assists in switching from roman to arabic page numbering
\newrobustcmd\mainstart{\cleardoublepage\pagenumbering{arabic}}
