  %% ist-report.cls
  %% Copyright 2018 Daniel de Schiffart
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
\ProvidesClass{ist-thesis}[2018/12/30 v0.0.2 Unofficial IST thesis class]

\RequirePackage{etoolbox}
\RequirePackage{ifluatex}
\RequirePackage{ifxetex}
\RequirePackage{ifpdf}

\newbool{@portuguese}
\newbool{@english}
\newbool{@origmath}

\DeclareOption{portuguese}	{\booltrue{@portuguese}}
\DeclareOption{english}		{\booltrue{@english}}
\DeclareOption{origmath}	{\booltrue{@origmath}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

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

	% == Language Settings == %
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

	% == Language Settings == %
	\ifbool{@portuguese}
		{ \PassOptionsToPackage{english, main = portuguese}{babel} }
		{ \PassOptionsToPackage{portuguese, main = english}{babel} }

	\RequirePackage{babel}
}
\ifbool{@origmath}{}{\RequirePackage{newtxsf}}

\RequirePackage{microtype}
\RequirePackage{caption}
\RequirePackage{subcaption}

\geometry{a4paper,
	vmargin = 2.5cm,
	hmargin = 2.5cm,
}
\renewcommand\baselinestretch{1.5}
