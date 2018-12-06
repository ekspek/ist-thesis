\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-thesis}[2018/11/28 v0.0.1 Unofficial IST thesis class]

\RequirePackage{etoolbox}
\RequirePackage{ifluatex}
\RequirePackage{ifxetex}
\RequirePackage{ifpdf}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ExecuteOptions{}
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
	\RequirePackage{mathspec}
	\defaultfontfeatures{Ligatures = TeX}
	\setmainfont[
		UprightFont = *-regular,
		Extension = .otf,
		BoldFont = *-bold,
		ItalicFont = *-italic,
		BoldItalicFont = *-bolditalic]{texgyreheros}
	\setmathfont(Digits)[
		UprightFont = *-regular,
		Extension = .otf,
		BoldFont = *-bold,
		ItalicFont = *-italic,
		BoldItalicFont = *-bolditalic]{texgyreheros}
	\setmonofont[Scale = 1.14]{inconsolata}
	
	% == Language Settings == %
	\RequirePackage{polyglossia}
	\setmainlanguage{portuges}
	\setotherlanguage[variant = british]{english}
}{
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T1]{fontenc}
	\RequirePackage{tgheros}
	\renewcommand{\familydefault}{\sfdefault}
	\RequirePackage[scaled = 1.14]{inconsolata}
	
	% == Language Settings == %
	\RequirePackage[portuguese]{babel}
}
\RequirePackage{newtxsf}

\RequirePackage{microtype}
\RequirePackage{caption}
\RequirePackage{subcaption}

\geometry{a4paper,
	vmargin = 2.5cm,
	hmargin = 2.5cm,
}
\renewcommand\baselinestretch{1.5}
