/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex

%%
\s+                   /* skip whitespace */
"0"                   return 'ZERO';
"1"                   return 'ONE';
"."                   return 'DOT';
<<EOF>>               return 'EOF';

/lex

/* operator associations and precedence */


%start s

%% /* language grammar */

s
    : list EOF {
        return -1;
    }
;

list
    : list bin {
        $$ = true;
    }
    | entero DOT {
        $$ = {
            val: $1,
            factor: 0.5
        }
    }
;

entero
    : entero bin { $$ = $1 * 2 + $2 }
    | bin   { $$ = $1; } 
    ;

bin
    : ONE { $$ = 1; }
    | ZERO { $$ = 0; }
    ;