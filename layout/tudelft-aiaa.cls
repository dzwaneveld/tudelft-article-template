% This template is a derivative of the 'Preparation of Papers for AIAAA
% Technical Conferences' by AIAA and Overleaf, used under CC BY 4.0. Created
% for AE2223-I, but essentially a simple (twocolumn) article template.
%
% This template by Daan Zwaneveld is licensed under CC BY-NC 4.0. To view a
% copy of this license, visit https://creativecommons.org/licenses/by-nc/4.0/.
% No attribution is required in PDF outputs created using this template.

%% Class is based on the default article class and options will be passed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{layout/tudelft-aiaa}[23/05/2022, v1.3 TU Delft Article Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[letterpaper,11pt]{article}

%% Main packages in the document --- Some are imported later in the class file
\RequirePackage{mathtools}    % Mathematical tools to use with amsmath
\RequirePackage{amssymb}      % Extended symbol collection
\RequirePackage{siunitx}      % Comprehensive (SI) units package

\RequirePackage{tabularx}     % Tabulars with adjustable-width columns
\RequirePackage{booktabs}     % Publication quality tables
\RequirePackage{longtable}    % Allow tables to flow over page boundaries
\RequirePackage{multirow}     % Create tabular cells spanning multiple rows

\RequirePackage{graphicx}     % Enhanced support for images
\RequirePackage{float}        % Improved interface for floating objects
\RequirePackage[tableposition=top,font=bf,labelsep=period]{caption} % Captions
\RequirePackage{subcaption}   % Support for sub-captions

\RequirePackage[margin=1in]{geometry} % Customize document dimensions
\RequirePackage{setspace}     % Set space between lines
\RequirePackage[hyphens]{url} % Verbatim with URL-sensitive line breaks
\RequirePackage{hyperref}     % Extensive support for hypertext
\RequirePackage[T1]{fontenc}  % Standard package for selecting font encodings
\RequirePackage{microtype}    % Refinements towards typographical perfection
\RequirePackage{newtxtext,newtxmath} % Use a font similar to Times New Roman
\RequirePackage[capitalise]{cleveref} % Intelligent cross-referencing
\RequirePackage{xspace}       % Define commands that appear not to eat spaces
\RequirePackage[indentfirst=false,font+=small,leftmargin=0.4in,rightmargin=0pt,vskip=0pt]{quoting} % Consolidated environment for displayed text

%% Add compatibility for twocolumn option
\if@twocolumn%
    \newcommand{\AlwaysPagewidth}[1]{\twocolumn[\begin{@twocolumnfalse} #1 \end{@twocolumnfalse}]}
\else%
    \newcommand{\AlwaysPagewidth}[1]{#1}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% I. Main Layout Parameters %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Setting up the title
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

%% Formatting abstract
\RequirePackage[style]{abstract}
\renewcommand{\abstitlestyle}[1]{}
\renewcommand{\abstracttextfont}{\bfseries\normalsize}
\setlength{\absleftindent}{0.5in}
\setlength{\absrightindent}{0.5in}

%% Formatting the section titles
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

%% Formatting spacing
\setlength{\abovedisplayskip}{\baselineskip}
\setlength{\belowdisplayskip}{\baselineskip}
\setlength{\abovedisplayshortskip}{\baselineskip}
\setlength{\belowdisplayshortskip}{\baselineskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% II. Setting Up the Bibliography %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[sort&compress,numbers]{natbib}
\bibliographystyle{layout/tudelft-aiaa}
\renewcommand{\bibfont}{\small} % Reduce font size
\setlength{\bibsep}{1pt} % Reduce white space

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% III. Miscellaneous Customization %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Setting up nomenclature with '=' separator (via https://tex.stackexchange.com/a/273979)
\RequirePackage{nomencl}
\makenomenclature % Enable the nomenclature
\newdimen\nomequalsign % Setting spacing for the '=' separator
\renewcommand{\nomlabel}[1]{%
  \sbox\z@{#1\hspace{\labelsep}$=$}%
  \ifdim\nomequalsign<\wd\z@\global\nomequalsign\wd\z@\fi
  #1\hfil\hspace{\labelsep}$=$%
}
\renewcommand{\nompostamble}{%
  \protected@write\@auxout{}{\global\nomequalsign=\the\nomequalsign}%
}

\setlength{\nomitemsep}{-\parsep} % Reduce white space in nomenclature

%% Customizing lists
\RequirePackage{enumitem}
\setlist{labelindent=\parindent,leftmargin=*,nosep}
\setlist[enumerate]{label={\arabic*)}}

%% Setting up the lettrine package
\RequirePackage{lettrine}
\setlength{\DefaultNindent}{0pt}

%% Adjusting the vertical spacing in tables
\renewcommand{\arraystretch}{1.2}
