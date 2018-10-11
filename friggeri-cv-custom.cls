\ProvidesClass{friggeri-cv-custom}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}
\RequirePackage[a4paper, left=6.1cm,top=2cm,right=2.5cm,bottom=2cm,nohead,nofoot]{geometry}

\definecolor{white}{RGB}{255,255,255}

\definecolor{dark}{HTML}{000000}
\definecolor{darkgray}{HTML}{151515}
\definecolor{gray}{HTML}{303030}
\definecolor{lightgray}{HTML}{454545}
\definecolor{lightlightgray}{HTML}{606060}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\definecolor{primary}{HTML}{F0F8FF}
\definecolor{secondary}{HTML}{E1B04F}
\definecolor{tierce}{HTML}{E14F4F}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{primary}
  \colorlet{header}{dark}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{darkgray}
\colorlet{side-section-color}{secondary}
\colorlet{content-section-color}{tierce}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont{Roboto-Regular}[Path=fonts/]
\newfontfamily\thinfont{Roboto-Thin}[Path=fonts/]
\newfontfamily\boldfont{Roboto-Bold}[Path=fonts/]
\newfontfamily\headingfont{Roboto-Medium}[Path=fonts/]
\newfontfamily\positionfont{Roboto-LightItalic}[Path=fonts/]
\newfontfamily\aboutfont{Roboto-Italic}[Path=fonts/]

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Roboto-Light}

%\setmathfont{XITS Math}

\newcommand{\Csharp}{%
  {\settoheight{\dimen0}{C}C\kern-.05em \resizebox{!}{\dimen0}{\raisebox{\depth}{\#}}}}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}
\RequirePackage{fontawesome}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \positionfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3.2cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{36pt}{36pt}\color{header}%
      {\bodyfont #1 }~{\boldfont #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{14pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{0.4cm}
}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{.75\parskip}
  {%
    \LARGE\headingfont\color{content-section-color}%
     #1%
  }
  \par
}
\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \LARGE\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}
\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}p{2.8cm}l}%was ll
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newenvironment{entrylistFormation}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}p{0.8cm}l}%was ll
}{%
  \end{tabular*}
}

\newcommand{\entry}[5]{%
  \parbox[t]{14cm}{%
    \textbf{#1}%
    \hfill%
    {#2}\\%
    {\positionfont{#3}}
    \hfill%
    {\footnotesize\addfontfeature{Color=gray} #4}\\%
    {#5}\vspace{\parsep}%
  }}

\newcommand{\about}[1]{%
  \parbox[t]{14cm}{%
    \hfill\aboutfont{#1}%
  }%
}



\newcommand{\body}[1]{%
\par
    &\parbox[t]{14.5cm}{%
    {#1}
    \vspace{\parsep}
    \vspace{\parsep}
}\\}



\newcommand{\entryundated}[4]{%
    \textbf{#1}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #2}\\%
    {\positionfont{#3}}%
    \ifthenelse{\equal{#3}{}}{}{\\}%
    {#4}\vspace{\parsep}%
\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\LARGE\headingfont\color{side-section-color} ##1}
  }
  \begin{textblock}{4.9}(0.7, 3.3)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

% biblatex name formatting changed with version 3.3.
% After this change the line "\ifblank{#3}{}{#3\space}#1%" gives an error.
% see also: http://tex.stackexchange.com/questions/327316/updating-friggeris-cv-making-it-work-with-texlive-2015-and-up-too-many-erro

%\DeclareNameFormat{author}{%
%  \small\addfontfeature{Color=lightgray}%
%  \ifblank{#3}{}{#3\space}#1%
%  \ifthenelse{\value{listcount}<\value{liststop}}
%    {\addcomma\space}
%    {}%
%}

% Fix for biblatex 3.3
\DeclareNameFormat{author}{%
   \nameparts{#1}
   \small\addfontfeature{Color=lightgray}%
   \ifblank{\namepartgiven}{}{\namepartgiven\space}#1%
   \ifthenelse{\value{listcount}<\value{liststop}}
     {\addcomma\space}
     {}%
}

\defbibheading{bibheading}[\bibname]{%
   \subsubsection*{#1}
   \markboth{#1}{#1}
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=bibheading]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%


\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=false,
    citecolor=false,
    filecolor=false,
    urlcolor = false}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother

%
% style
%

\newcommand{\exphig}[1]{\textcolor{darkgray}{\boldfont{#1}}}
\newcommand{\expmed}[1]{\textcolor{gray}{\bodyfont{#1}}}
\newcommand{\explow}[1]{\textcolor{lightgray}{\thinfont{#1}}}

% Expérimenté
% Intermédiaire
% Notion
