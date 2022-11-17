\ProvidesClass{gdbdg}[2022/11/11 Document class]
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{xstring}


\newcommand{\@use@header}{false}


\DeclareOption{header}{
    \renewcommand{\@use@header}{true}
}
\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass[12pt, a4paper, oneside]{article} %draft

\input{data/metadata.tex}

\input{src/packages.tex}
\pgfplotsset{compat=1.18}
% Colors (colors options files)
\input{src/colors/default_colors.tex}

%Geometry

% Listings config
\input{src/listings/listings_default_config.tex}

\IfEq{\@use@header}{true}{
    \input{src/geometry/geometry_settings_header.tex}
    \input{src/header/header_variables.tex}
    \input{data/header_data.tex}
    \header[\@headerlefticon]
        {\@headertitle} % Middle title (can't stay empty)
        {\@headerlastname} % last name (l1 right)
        {\@headerfirstname} % first name (l2 right)
        [\@headerrighticon]

}{
    \input{src/geometry/geometry_settings.tex}
}


%TODO décomposer les packages en plein d'options
% Gérer tout çà dans le fichier packages.tex