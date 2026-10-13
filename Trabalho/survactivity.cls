\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{survactivity}[2024/08/12 Classe para Atividades (KOMA-Script)]

% Opções da classe
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
%% KOMA-Script: Alterada a classe base de 'extarticle' para 'scrartcl'.
% Adicionada a opção 'headings=standardclasses' para facilitar a customização
% de títulos de forma similar às classes padrão, sem perder o poder do KOMA.
\LoadClass[12pt,a4paper,headings=standardclasses]{scrartcl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Configuração do Layout da Página
\RequirePackage{geometry}
\geometry{
    top=1cm,
    bottom=1cm,
    left=2cm,
    right=2cm,
    headheight=17pt,
    includehead,includefoot,
    heightrounded,
}

\RequirePackage{indentfirst}
\RequirePackage{setspace}
\onehalfspacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Formatação de Títulos

\setkomafont{section}{\Large\bfseries\sffamily}
\setkomafont{subsection}{\large\bfseries\sffamily}

\RedeclareSectionCommand[
  beforeskip=3mm,
  afterskip=5mm
]{section}
\RedeclareSectionCommand[
  beforeskip=3mm,
  afterskip=5mm
]{subsection}

\renewcommand*{\sectionformat}{%
  \rlap{\color{black!70}\rule[-6pt]{\textwidth}{1.2pt}}%
  \colorbox{black!70}{%
    \raisebox{0pt}[13pt][3pt]{\makebox[30pt]{%
      \fontfamily{phv}\selectfont\color{white}{\thesection}%
    }}%
  }\hspace{15pt}%
}

\renewcommand*{\subsectionformat}{%
  \rlap{\color{black!50}\rule[-6pt]{\textwidth}{1.2pt}}%
  \colorbox{black!50}{%
    \raisebox{0pt}[13pt][3pt]{\makebox[30pt]{%
      \fontfamily{phv}\selectfont\color{white}{\thesubsection}%
    }}%
  }\hspace{15pt}%
}

\addtokomafont{section}{\color{black}}
\addtokomafont{subsection}{\color{black!60}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Pacotes Essenciais
% \RequirePackage[utf8]{inputenc}
% \RequirePackage[brazilian]{babel}
% \RequirePackage[T1]{fontenc}
\RequirePackage{multicol}
\RequirePackage{color,colortbl}
\RequirePackage{xcolor}
\PassOptionsToPackage{dvipsnames}{xcolor}
\RequirePackage{enumitem}
\PassOptionsToPackage{shortlabels}{enumitem}
\RequirePackage{etoolbox}
\usepackage{chemfig}
\usepackage{mhchem}
\usepackage{indentfirst}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -------------------------------------------------
% 2. Matemática e teoremas
% -------------------------------------------------
\usepackage{amsmath, amsthm, amssymb}
\usepackage[framemethod=tikz]{mdframed}
\usepackage{mathtools}

  \newcommand{\var}[1]{\operatorname{var}\!\left(#1\right)}
  \newcommand{\cov}[1]{\operatorname{cov}\!\left(#1\right)}
  \newcommand{\cor}[1]{\operatorname{cor}\!\left(#1\right)}
\RequirePackage{cases}
\RequirePackage{multirow}
\RequirePackage{array,booktabs}
\RequirePackage{tabularx}
\RequirePackage{siunitx}
\RequirePackage{amsfonts}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Configurações de Fontes
\RequirePackage{times}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Teoremas e Ambientes
\makeatletter

% --- Ambiente question ---
\theoremstyle{definition}
\newtheorem{questao}{Exercício}
% \counterwithin*{question}{section}

% --- Ambiente solution ---
\newtheorem*{solucao}{Solução} % sem numeração


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Comandos Personalizados
% Conjuntos numéricos
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}

% --- Listas Customizadas ---
\newlist{partes}{enumerate}{3}
\setlist[partes]{label=(\alph*)}
\newcommand{\parte}{\item}

\newlist{subpartes}{enumerate}{3}
\setlist[subpartes]{label=\roman*)}
\newcommand{\subparte}{\item}
% ---------------------------

% Variáveis internas sem uso de @ (mais seguro)
\newcommand{\survclass}{Nome da Disciplina}
\newcommand{\survexamnum}{Número da Atividade}
\newcommand{\survteacher}{Nome do Professor}
\newcommand{\survstudent}{Nome do Aluno}

% Comandos públicos que alteram as variáveis internas
\newcommand{\class}[1]{\renewcommand{\survclass}{#1}}
\newcommand{\examnum}[1]{\renewcommand{\survexamnum}{#1}}
\newcommand{\teacher}[1]{\renewcommand{\survteacher}{#1}}
\newcommand{\student}[1]{\renewcommand{\survstudent}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Cabeçalho
\RequirePackage{hyperref}

\AtBeginDocument{
    \noindent
    \begin{tabular*}{\textwidth}{l @{\extracolsep{\fill}} c @{\extracolsep{\fill}} l}
        \textbf{\survclass} & \textbf{\survexamnum} & {\survstudent} \\
        PG Biometria & & {\survteacher} \\
    \end{tabular*}\\
    \rule[2ex]{\textwidth}{2pt}
    \vspace{-3em}
    \renewcommand{\maketitle}{}
}



