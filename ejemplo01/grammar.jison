/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex

%%
\s+                   /* skip whitespace */
[0-9]                 return 'NUMBER';
","                   return 'COMMA';
"="                   return 'EQ';
"("                   return 'OPENPAR';
")"                   return 'CLOSEPAR';
<<EOF>>               return 'EOF';

/lex

/* operator associations and precedence */


%start s

%% /* language grammar */

s
    : list CLOSEPAR EOF
        { return $1 }
    ;

list
    : list COMMA NUMBER {
        $$ = {
            base: $1.base,
            contador: $1.base === $3 ? $1.contador + 1 : $1.contador,
            L: $1,
            N: $3
        }
    }
    | NUMBER EQ OPENPAR NUMBER {
        $$ = {
            base: $1,
            contador: $1 === $4 ? 1 : 0,
            N1: $1,
            N2: $4
        }
    }
;