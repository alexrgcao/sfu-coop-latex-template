\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_cv}[2022/02/01 My custom CV class]

\LoadClass[11pt]{article} % Base this class on the standard 'article' class

\pagestyle{empty}

\RequirePackage{geometry}
\RequirePackage{xcolor} % Add this line at the top of your .cls file
\usepackage{afterpage}
\usepackage{fancyhdr}
\usepackage[inline]{enumitem}
\usepackage{fontspec}

\setmainfont[
  BoldFont={HarmonyOS_Sans_Bold.ttf}, 
]{HarmonyOS_Sans_Regular.ttf}

\newfontfamily\extraboldfont{HarmonyOS_Sans_Black.ttf}
\newfontfamily\mediumfont{HarmonyOS_Sans_Medium.ttf}


\geometry{a4paper, margin=0.5in} % Set page geometry

% Define a new command for the CV header
\newcommand{\header}[5][]{ % Add a fourth argument for the color
  \definecolor{headercolor}{HTML}{2B676E} % Define a new color with the specified HTML color code
  \noindent
  {\color{headercolor}\fontsize{24pt}{28.8pt}\selectfont\textbf{\extraboldfont #2}}\\ [3pt] % Name
  {\color{headercolor}\fontsize{12pt}{14.4pt}\selectfont\texttt{\mediumfont #3 |}} % City
  {\color{headercolor}\fontsize{12pt}{14.4pt}\selectfont\texttt{\mediumfont #4 |}} % Email
  {\color{headercolor}\fontsize{12pt}{14.4pt}\selectfont\texttt{\mediumfont #5}} \\ % Contact info
  \noindent
  \ifx&#1&
  \else
      {\color{headercolor}\fontsize{12pt}{14.4pt}\selectfont\texttt{\mediumfont{#1}}}
      \vspace{10pt}
  \fi
}

\RequirePackage{tikz} % Add this line at the top of your .cls file

\definecolor{sectioncolour}{HTML}{5E7491}
\definecolor{color1}{HTML}{5E7178}
\definecolor{color2}{HTML}{E7F0F3}

% Define a new command for the gradient line
\newcommand{\gradientline}[1]{
  \noindent\begin{tikzpicture}
    \shade[left color=color1, right color=color2, rounded corners=2pt] (0,-0.1) rectangle (\linewidth,0.5pt);
    \node[align=left, fill=white, inner sep=3pt, outer sep=24pt, anchor=west, text depth=-1ex] at (0\linewidth,0pt) {\fontsize{16pt}{19.2pt}\selectfont\textbf{\textcolor{sectioncolour}{#1}}};
  \end{tikzpicture}
}

% Define a new command for education entries
\newcommand{\education}[6][]{
  \item \textbf{#2} \hfill \textbf{#3 -- #4} \\
  \if\relax\detokenize{#1}\relax\else \textbf{Minor: #1} \\\fi
  #5 \\
  Location: #6
}

% Define a new command for skill entries
\newcommand{\skill}[2][]{
  \item \textbf{#1:} #2
}
\RequirePackage{etoolbox} 

% Define a new command for project entries
\newcommand{\academic}[7][]{
  \item \textbf{#2} \hfill \textbf{#3 -- #4} \\
  \textbf{#5}, \textbf{#6} \if\relax\detokenize{#1}\relax\else \\Link: #1\fi
  \begin{itemize}[label={$\bullet$}, noitemsep, topsep=0pt, partopsep=0pt]
    \forcsvlist{\item \raggedright}{#7} % Use a loop to create the list items
  \end{itemize}
}

% Define a new command for experience entries
\newcommand{\experience}[6]{
  \item \textbf{#1} \hfill \textbf{#2 -- #3} \\
  \textbf{#4}, \textbf{#5} 
  \begin{itemize}[label={$\bullet$}, noitemsep, topsep=0pt, partopsep=0pt]
    \forcsvlist{\item}{#6} % Use a loop to create the list items
  \end{itemize}
}
% Define a new environment for the CV sections
\newenvironment{cvsection}[1]{
  \gradientline{#1}
  \begin{itemize}
    \renewcommand{\labelitemi}{}
}{
  \end{itemize}
}

% Define a new command for CV items
\newcommand{\cvitem}[2]{
  \item \textbf{#1}: #2
}

\newcommand{\coverletter}[9]{
  \vspace*{1\baselineskip}
  \noindent #1
  \vspace*{1\baselineskip}
  
  \noindent #2 \\
  \noindent #3 \\
  \noindent #4 \\
  \noindent #5  
  
  \vspace*{1\baselineskip}
  \noindent\textbf{Re: #6}
  
  \vspace*{1\baselineskip}
  \noindent Dear #7, 

  \vspace*{1\baselineskip}
  \noindent #8 \\

  \noindent Sincerely, 
  
  \vspace*{1\baselineskip}
  \vspace*{1\baselineskip}
  \noindent #9
}
