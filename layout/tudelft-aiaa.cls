% This class provides an article template for AE2223-I. It is based
% on the official AIAA template with only small changes to ensure
% a consistent paper following all the guidelines.
%
% Rewritten template by Daan Zwaneveld. Original template by Overleaf
% (v1.2) available under CC BY-NC 4.0.
%
% This template is available under CC BY-NC 4.0. For more information,
% see https://creativecommons.org/licenses/by-nc/4.0/. No attribution
% is required in articles created using this template.

%% Class file is based on the default article class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{layout/tudelft-aiaa}[11/06/2020, v1.1]
\LoadClass[11pt]{article}

%% All unknown options will be passed to the report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%% Required Packages
\RequirePackage{microtype}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage[letterpaper,margin=1in]{geometry}
\RequirePackage{setspace}
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}
\RequirePackage[indentfirst=false,font+=small,leftmargin=0.4in,rightmargin=0pt,vskip=0pt]{quoting}

%%%%% Adding Compatibility for Two Columns %%%%%

\if@twocolumn%
    \newcommand{\AlwaysPagewidth}[1]{\twocolumn[\begin{@twocolumnfalse} #1 \end{@twocolumnfalse}]}
\else%
    \newcommand{\AlwaysPagewidth}[1]{#1}
\fi

%%%%% Setting Main Layout Parameters %%%%%

%% Defining Title
\RequirePackage[blocks]{authblk}
\renewcommand{\Authfont}{\normalsize\upshape}
\renewcommand{\Affilfont}{\normalsize\itshape}
\setlength{\affilsep}{0pt}

\renewcommand{\maketitle}{%
  \begingroup
  \renewcommand\and{\\[\baselineskip]}
  \centering\singlespacing
  {\LARGE\bfseries\@title\par}
  \vskip2\baselineskip
  \@author\par
  \endgroup
  \vskip\baselineskip
  \setcounter{footnote}{0}
}

%% Define Abstract
\RequirePackage[style]{abstract}
\renewcommand{\abstitlestyle}[1]{}
\renewcommand{\abstracttextfont}{\bfseries\normalsize}
\setlength{\absleftindent}{0.5in}
\setlength{\absrightindent}{0.5in}

%% Formatting the Section Titles
\RequirePackage[explicit]{titlesec}
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\thesection.\Alph{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\titleformat{\section}
  {\large\bfseries\singlespacing\centering}
  {\thesection.\space}{0pt}{#1}[]
\titlespacing*{\section}{0pt}{0.5\baselineskip}{0pt}
\titleformat{\subsection}
  {\normalsize\bfseries\singlespacing}
  {\Alph{subsection}.\space}{0pt}{#1}[]
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0pt}
\titleformat{\subsubsection}
  {\normalsize\itshape\singlespacing}
  {\arabic{subsubsection}.\space}{0pt}{#1}[]
\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0pt}

%% Formatting Spacing
\setlength{\abovedisplayskip}{\baselineskip}
\setlength{\belowdisplayskip}{\baselineskip}
\setlength{\abovedisplayshortskip}{\baselineskip}
\setlength{\belowdisplayshortskip}{\baselineskip}

%% Setting up References
\RequirePackage[sort&compress,numbers]{natbib}
\bibliographystyle{layout/tudelft-aiaa}
\renewcommand{\bibfont}{\small}

%%%%% Miscellaneous Customization %%%%%

%% Setting up nomenclature with '=' separator (via https://tex.stackexchange.com/a/273979)
\RequirePackage{nomencl}
\makenomenclature % Enable the nomenclature
\newdimen\nomwidest % Setting spacing for the '=' separator
\renewcommand{\nomlabel}[1]{%
  \sbox\z@{#1\hspace{\labelsep}$=$}%
  \ifdim\nomwidest<\wd\z@\global\nomwidest\wd\z@\fi
  #1\hfil\hspace{\labelsep}$=$%
}
\renewcommand{\nompostamble}{%
  \protected@write\@auxout{}{\global\nomwidest=\the\nomwidest}%
}

%% Customizing Enumerates and Itemizes
\RequirePackage{enumitem}
\setlist{labelindent=\parindent,leftmargin=*,nosep}
\setlist[enumerate]{label={\arabic*)}}

%% Setting up Lettrine
\RequirePackage{lettrine}
\setlength{\DefaultNindent}{0pt}

%% Abbreviating Autoref Eq. and Fig.
\def\figureautorefname{Fig.}
\def\equationautorefname{Eq.}

%% Customizing Captions
\RequirePackage[tableposition=top,font=bf,labelsep=period]{caption}
\renewcommand{\arraystretch}{1.2}
