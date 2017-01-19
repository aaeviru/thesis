\ProvidesClass{suribtabst}
  [2007/01/30 KUROKI Yusuke]
\newif\ifdraft
\DeclareOption{draft}{\drafttrue}
\DeclareOption{final}{\draftfalse}
\newif\ifjisfont
\jisfonttrue
\DeclareOption{mingoth}{\jisfontfalse}
\newif\ifwinjis
\winjisfalse
\DeclareOption{winjis}{\winjistrue}
\newif\ifpapersize
\papersizefalse
\DeclareOption{papersize}{\papersizetrue}
\newif\if@english
\@englishfalse
\DeclareOption{english}{\@englishtrue}
\newif\if@belongstosuri
\DeclareOption{mi}{\@belongstosuritrue}
\DeclareOption{suri}{\@belongstosuritrue}
\DeclareOption{ipc}{\@belongstosurifalse}
\DeclareOption{system}{\@belongstosurifalse}
\newif\if@undergraduate
\newif\if@graduatedoctor
\DeclareOption{bachelor}{\@undergraduatetrue}
\DeclareOption{master}{\@undergraduatefalse\@graduatedoctorfalse}
\DeclareOption{doctor}{\@undergraduatefalse\@graduatedoctortrue}
\ExecuteOptions{final,tocchaplong,mi,master}
\ProcessOptions
\LoadClass[a4paper,twocolumn,notitlepage,11pt
\ifdraft ,draft\else ,final\fi%
\ifwinjis ,winjis\else\ifjisfont\else ,mingoth\fi\fi%
,twoside%
\ifpapersize ,papersize\fi%
\if@english ,english\fi%
]{jsarticle}
%% 本当はやってはいけないとされている |\{h,v}offset| のマイナス指定な
%% どを多用しています．
\setlength{\voffset}{-1truein}
\setlength{\footskip}{7mm}
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-\baselineskip}
\addtolength{\textheight}{-\topskip}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-\footskip}
\addtolength{\textheight}{-\topskip}
\divide\textheight\baselineskip
\multiply\textheight\baselineskip
\addtolength{\textheight}{\topskip}
\addtolength{\textheight}{0.1pt}

\setlength{\hoffset}{-1truein}
\setlength{\oddsidemargin}{12mm}
\setlength{\evensidemargin}{12mm}
\setlength{\fullwidth}{\paperwidth}
\addtolength{\fullwidth}{-\oddsidemargin}
\addtolength{\fullwidth}{-\evensidemargin}
\setlength{\textwidth}{\fullwidth}
\def\ps@abstheadings{%
  \let\@mkboth\@gobbletwo
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  \def\@evenhead{\hfill\leftmark\hfill}%
  \let\@oddhead\@empty}%
\newcommand*{\titlewidth}[1]{\gdef\title@width{#1}}% #1: タイトル幅
\gdef\title@width{\hsize}
\newcommand*{\studentid}[1]{\gdef\@studentid{#1}}% #1: 学生証番号
\renewcommand{\and}{\\ &}% [2005/12/09]
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}% #1: 指導教員名 + 役職 [2005/12/09]
\gdef\@supervisor@prefix{\if@english Supervisor\else 指導教員\fi}
\newcommand*{\handin}[2]{\year #1 \month #2 \day 0}% #1: 年, #2: 月
\newcommand*{\eauthor}[1]{\gdef\@eauthor{#1}}% #1: 著者名英語つづり
\newcommand*{\email}[1]{\gdef\authors@email{#1}}% #1: e-mail アドレス
\newcommand*{\keywords}[1]{\gdef\@keywords{#1}}% #1: キーワード
\gdef\@keywordsprefix{\if@english Keywords\else キーワード\fi}
\if@undergraduate
  \if@english
    \gdef\@subtitle{Bachelor's~Thesis}
    \if@belongstosuri
      \gdef\@belongsto{Mathematical Information Engineering Course\\%
      Department of Mathematical Engineering and Information Physics\\%
      Faculty of Engineering, the University of Tokyo}%
      \gdef\@institutionshort{Dept.~Math.~Eng.~Inf.~Phys.}%
    \else
      \gdef\@belongsto{Information Physics Course\\%
      Department of Mathematical Engineering and Information Physics\\%
      Faculty of Engineering, the University of Tokyo}%
      \gdef\@institutionshort{Dept.~Math.~Eng.~Inf.~Phys.}%
    \fi
  \else
    \gdef\@subtitle{卒業論文}
    \if@belongstosuri
      \gdef\@belongsto{東京大学工学部計数工学科数理情報工学コース}%
      \gdef\@institutionshort{計数工学科}%
    \else
      \gdef\@belongsto{東京大学工学部計数工学科システム情報工学コース}%
      \gdef\@institutionshort{計数工学科}%
    \fi
  \fi
\else
  \if@english
    \if@belongstosuri
      \gdef\@belongsto{Department of Mathematical Informatics\\%
        Graduate School of Information Science and Technology\\%
        the University of Tokyo}%
      \gdef\@institutionshort{Dept.~of Mathematical Informatics}%
    \else
      \gdef\@belongsto{Department of Information Physics and Computing\\%
        Graduate School of Information Science and Technology\\%
        the University of Tokyo}%
      \gdef\@institutionshort{Dept.~Inf.~Phys.~Comput.}%
    \fi
  \else
    \if@belongstosuri
      \gdef\@belongsto{東京大学大学院情報理工学系研究科数理情報学専攻}%
      \gdef\@institutionshort{数理情報学専攻}%
    \else
      \gdef\@belongsto{東京大学大学院情報理工学系研究科システム情報学専攻}%
      \gdef\@institutionshort{システム情報学専攻}%
    \fi
  \fi
  \if@graduatedoctor
    \if@english
      \gdef\@subtitle{Doctoral~Thesis}
    \else
      \gdef\@subtitle{博士論文}
    \fi
  \else
    \if@english
      \gdef\@subtitle{Master's~Thesis}
    \else
      \gdef\@subtitle{修士論文}
    \fi
  \fi
\fi
  \renewcommand{\maketitle}{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\advance\leftskip 3zw
        \parindent 1zw\noindent
        \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3zw}##1}%
          \twocolumn[\vskip-\headheight\@maketitle]%
      \@thanks
      \markboth{\headfont\footnotesize\underline{{\@title} (\@author)}}{}%
  \endgroup
    \setcounter{footnote}{0}%
  \global\let\maketitle\relax
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\subtitle\relax
  \global\let\title\relax
  \global\let\supervisor\relax
  \global\let\belongto\relax
  \global\let\email\relax
  \global\let\eauthor\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }
\def\@maketitle{%
\let\footnote\thanks
\headfont
\centering
 {\small {\@subtitle} 要旨}\\ \smallskip
 {\LARGE \@title}\\ \medskip
 \hfill
 \large\renewcommand{\arraystretch}{.9}\begin{tabular}{r@{\quad}l@{}}
  \normalsize{\@institutionshort} {\@studentid} &\Large \@author\\ \rule{0pt}{1.1zw}
  \normalsize\@supervisor@prefix & \@supervisor
 \end{tabular}\bigskip
}
  \renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
    {0.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
    {-1zw}% 改行せず 1zw のアキ
    {\normalfont\normalsize\headfont}}
\renewenvironment{thebibliography}[1]{%
  \global\let\presectionname\relax
  \global\let\postsectionname\relax
  \section*{\bibname}\addcontentsline{toc}{section}{\bibname}
  \small\narrowbaselines%
  \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty\clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}
\long\def\@makecaption#1#2{{\small%
  \advance\leftskip2zw
  \advance\rightskip2zw
  \@tempdimb\hsize
  \advance\@tempdimb-4zw
  \vskip\abovecaptionskip
  \setbox\tw@=\hbox{\hskip2zw{\headfont#1.}~}%
  \sbox\@tempboxa{{\headfont#1.}~#2}%
  \ifdim \wd\@tempboxa >\@tempdimb
    \list{\headfont#1.}{%
      \renewcommand{\makelabel}[1]{\hskip2zw##1\hfil}
      \itemsep    \z@
      \itemindent \z@
      \labelsep   \z@
      \labelwidth \wd\tw@
      \listparindent\z@
      \leftmargin \wd\tw@
      \rightmargin 2zw}\item\relax #2\endlist
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}}
\def\today{%
  \if@english
    \ifcase\month\or
      January\or February\or March\or April\or May\or June\or
      July\or August\or September\or October\or November\or December\fi
      %\space\number\day
      , \number\year
  \else
    \if西暦
      \number\year 年
      \number\month 月
      %\number\day 日
    \else
      平成\number\heisei 年
      \number\month 月
      %\number\day 日
    \fi
  \fi}
\pagestyle{abstheadings}
\pagenumbering{arabic}
\raggedbottom
\endinput
%%
%% End of file `suribtabst.cls'.
