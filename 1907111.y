%{
#include<bits/stdc++.h>
using namespace std;
#include <set>
set <string> func_name;
map <string, float> store;
map <string, float> storeConst;
int stmntcount = 0;
int yylex();
void yyerror(const char* s){
    std::cerr << "Error: " << s << std::endl;
    exit(EXIT_FAILURE);
}
%}


%union
{
    int intValue;
    float floatValue;
    char* str;
    char charValue;
};


%token IMPORT SCOM MCOM MAINO MAINC INTO INTC FLOATO FLOATC DUBO DUBC CHARO CHARC STRO STRC EQUAL STMNT PLUS MINUS MUL DIV LP RP PRINT ENDPRINT ROOT ENDROOT FOR ENDFOR COUNT ENDCOUNT CONDITION ENDCONDITION IF ENDIF ELSE ENDELSE MOD POW INC DEC LT LE GT GE NE WHILE ENDWHILE DO ENDDO FUN ENDFUN FUNCKEY CONST SIN ENDSIN COS ENDCOS TAN ENDTAN

%token <str> VAR
%token <floatValue> FLOAT
%token <intValue> INTEGER
%token <floatValue> DOUBLE
%token <charValue> CHAR
%token <str> STRING

%type <floatValue> exp
%type <str> multivar

%nonassoc IFX
%nonassoc ELSE
%left PLUS MINUS
%left MUL DIV
%left MOD
%right POW
%right INC DEC


%%
start: /* empty */
	| start line
	;



line: IMPORT { cout<<"Import Statement\n"<<endl; }
    | comment
    | function
    | MAINO  multistatement  MAINC { cout<<"Valid main function"<<endl; }
	;


comment: SCOM { cout<<"Single line comment"<<endl; }
    | MCOM  { cout<<"Multi line comment"<<endl; }



function: FUNCKEY VAR LP multistatement RP {
                if (func_name.find($2) != func_name.end()) {
                    cout << "!!!Error: Function \"" << $2 << "\" already Exists. Try some other name." << endl;
                }
                else{
                    func_name.insert($2);
                    cout<<"Function Defined Successfully!!!\n"<<endl;
                }        
            }
        | FUNCKEY VAR '[' dec ']' LP multistatement RP {
                if (func_name.find($2) != func_name.end()) {
                    cout << "!!!Error: Function \"" << $2 << "\" already Exists. Try some other name." << endl;
                }
                else{
                    func_name.insert($2);
                    cout<<"Function Defined Successfully!!!\n"<<endl;
                }        
            }




multistatement: 
	| multistatement statement
	;



statement: declaration
    | CONST cdeclaration';'
    | assignment
    | comment
    | exp';' { cout<<"The Value of the expression is: "<<$1<<endl; }
    | PRINT exp ENDPRINT { cout<<"Print the value--->"<<$2<<endl; }
    | PRINT STRING ENDPRINT { cout<<"Print the value--->"<<$2<<endl; }
    | CONDITION exp ENDCONDITION IF multistatement ENDIF %prec IFX{
								if($2){
									cout<<"Inside If Block "<<endl;
								}
							}
    | CONDITION exp ENDCONDITION IF multistatement ENDIF ELSE multistatement ENDELSE{
								if($2){
									cout<<"Inside If Block "<<endl;
								}
								else {
									cout<<"Inside Else Block "<<endl;
								}
							}
    | FOR COUNT exp ENDCOUNT multistatement ENDFOR {
									int i;
									cout<<"\nFOR LOOP has started\n";
									for(i=0;i<$3;i++){
										
										cout<<"Loop position: "<<i<<endl;
									}
                                    cout<<"For loop executed successfully!\n"<<endl;
								}
    | WHILE CONDITION exp ENDCONDITION DO COUNT exp ENDCOUNT multistatement ENDDO ENDWHILE {
                                    int i;
									cout<<"\nWHILE LOOP has started\n";
									for(i=0;i<$7;i++){
										
										cout<<"Loop position: "<<i<<endl;
									}
                                    cout<<"While loop executed successfully!\n"<<endl;

                                  }
    | FUN VAR ENDFUN {
                if (func_name.find($2) != func_name.end()) {
                        cout<<"Function \""<<$2<<"\" Called here."<<endl;
                }
                else {
                    cout<<"!!!Error-->This Function is not Defined!"<<endl; 
                }

        }
    | FUN VAR LP parameter RP ENDFUN {
                if (func_name.find($2) != func_name.end()) {
                        cout<<"Function \""<<$2<<"\" Called here."<<endl;
                }
                else {
                    cout<<"!!!Error-->This Function is not Defined!"<<endl; 
                }

        } 
    ;


parameter : ptype ',' parameter
        | ptype
        
ptype : VAR {
            if (store.find($1) == store.end()) {
            cout << "!!!Error: Used Undeclared Variable \"" <<$1<<"\""<<endl;
            }
        }
        | INTEGER
        | FLOAT
        | CHAR
        | STRING
        | DOUBLE

dec : declaration ',' dec
    | declaration
    ;

cdeclaration:INTO VAR INTC EQUAL exp {
        storeConst[$2] = $5;
        cout<<"Value Assigned to "<<$2<<" = "<<$5<<endl;
        cout<<"Variable type -> Integer Constant"<<endl;
        }
    
    | FLOATO VAR FLOATC EQUAL exp {
        storeConst[$2] = $5;
        cout<<"Value Assigned to "<<$2<<" = "<<$5<<endl;
        cout<<"Variable type -> Float Constant"<<endl;
        }

    | DUBO VAR DUBC EQUAL exp {
        storeConst[$2] = $5;
        cout<<"Value Assigned to "<<$2<<" = "<<$5<<endl;
        cout<<"Variable type -> Double Constant"<<endl;
        }
    ;


declaration:INTO multivar INTC {
        cout<<"Variable type -> Integer"<<endl;
        }
    
    | FLOATO multivar FLOATC {
        cout<<"Variable type -> Float"<<endl;
        }

    | DUBO multivar DUBC {
        cout<<"Variable type -> Double"<<endl;
        }
    | CHARO multivar CHARC {
        cout<<"Variable type -> Character"<<endl;
        }

    | STRO multivar STRC {
        cout<<"Variable type -> String"<<endl;
        }
    ;

multivar : VAR','multivar {
               if (store.find($1) != store.end()) {
            cout << "!!!Error: Variable \"" << $1 << "\" has already been declared." << endl;
        }
        else{
        store[$1] = 0.0;
        cout<<"Variable \""<<$1<<"\" has been declared"<<endl; } 
    }
    | VAR {  if (store.find($1) != store.end()) {
            cout << "!!!Error: Variable \"" << $1 << "\" has already been declared." << endl;
        }
        else{
        store[$1] = 0.0;
        cout<<"Variable \""<<$1<<"\" has been declared"<<endl; }
    }
    ;

assignment: VAR EQUAL exp';'   {
        if (storeConst.find($1) != storeConst.end()) {
            cout<< "!!!Error: can't Reassign to a Constant variable"<<endl;
        }
        else if (store.find($1) == store.end()) {
            cout << "!!!Error: Variable \"" << $1 << "\" has not been declared before assignment." << endl;
        }
        else{
        store[$1] = $3;
        cout<<"Value Assigned to "<<$1<<" = "<<$3<<endl;
        stmntcount++;
        }
    }
    | VAR EQUAL CHAR';'  {
        if (store.find($1) == store.end()) {
            cout << "!!!Error: Variable \"" << $1 << "\" has not been declared before assignment." << endl;
        }
        else{
        cout<<"Value Assigned to "<<$1<<" = "<<$3<<endl;
        stmntcount++;
        }
    }
    | VAR EQUAL STRING';'   {
        if (store.find($1) == store.end()) {
            cout << "!!!Error: Variable \"" << $1 << "\" has not been declared before assignment." << endl;
        }
        else{
        cout<<"Value Assigned to "<<$1<<" = "<<$3<<endl;
        stmntcount++;
        }
    }
    ;



exp: exp PLUS exp	{$$ = $1 + $3;}
	| exp MINUS exp	{$$ = $1 - $3;}
    | exp MUL exp {$$ = $1 * $3;}
    | exp DIV exp {
        if($3){
                $$ = $1 / $3;
		}
		else{
	            $$ = 0;
				cout<<"Divide be ZERO is not allowed"<<endl;
		} }
    | exp MOD exp {
        if($3){
		    $$ = static_cast<int>($1) % static_cast<int>($3);
		}
		else{
			$$ = $1;
			cout<<"Mod by Zero is not allowed\t"<<endl;
	} }
    | exp POW exp { $$ = pow($1,$3); }
    | exp LT exp { $$ = $1 < $3; }
    | exp GT exp { $$ = $1 > $3; }
    | exp LE exp { $$ = $1 <= $3; }
    | exp GE exp { $$ = $1 >= $3; }
    | exp NE exp { $$ = $1 != $3; }
    | exp INC { $$ = $1 + 1; }
    | exp DEC { $$ = $1 - 1; }
    | ROOT exp ENDROOT { $$ = sqrt($2); cout<<"\nCalculating Square Root"<<endl; }
	| SIN exp ENDSIN { $$ = sin($2*3.1416/180); cout<<"Calculating Sine value"<<endl; }
	| COS exp ENDCOS { $$ = cos($2*3.1416/180); cout<<"Calculating Cosine value"<<endl; }
	| TAN exp ENDTAN { $$ = tan($2*3.1416/180); cout<<"Calculating Tangent value"<<endl; }
    | LP exp RP	{$$ = $2;}
    | VAR { $$ = store[$1]; }
	| INTEGER {$$ = $1;}
	| FLOAT {$$ = $1;}
	| DOUBLE {$$ = $1;}
	;


%%

int main()
{
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    yyparse();
    
    return 0;
}
