
/* Subjects considered
"1 - Data Structures"
"2 - Advanced Programming"
"3 - Database Management"
"4 - Computer Networks"
"5 - Design Drawing"
"6 - Interactive Systems"
"7 - Bioinformatics"
"8 - Genetics"
"9 - Cryptography"
"10 - Machine Learning"
"11 - Artificial Intellijence"
"12 - Entrepreneurship (min[as1or)"
"13 - Economics (minor)"

Programming languages considered
SQL
Java
Python
C++
Javascript
HTML
CSS
Prolog

interests considered
sports
research
management
civil_services
competitive_programming
writing
painting
photography

*/

go:-
    write("Enter grades for subjects taken from the following subjects"), nl,
    write("1 - Data Structures"), nl,
    write("2 - Advanced Programming"), nl,
    write("3 - Database Management"), nl,
    write("4 - Computer Networks"), nl,
    write("5 - Design Drawing"), nl,
    write("6 - Interactive Systems"), nl,
    write("7 - Bioinformatics"), nl,
    write("8 - Genetics") , nl,
    write("9 - Cryptography"), nl,
    write("10 - Machine Learning"), nl,
    write("11 - Artificial Intellijence"), nl,
    write("12 - Entrepreneurship"), nl,
    write("13 - Economics"), nl,
    write("Grade can be a, b, c, d or f. Type done for \'Enter code\' field when all grades entered."), nl,
    getGrades(GList),
    forall(member(El, GList), assert(recG(El))),
    write("Choose from the following programming languages (when all interested codes entered type done)"), nl,
    write("14 - SQL"), nl,
    write("15 - Java"), nl,
    write("16 - Python"), nl,
    write("17 - C++"), nl,
    write("18 - Javascript"), nl,
    write("19 - HTML"), nl,
    write("20 - CSS"), nl,
    write("21 - Prolog"), nl,
    getProgrammingLang(PList),
    forall(member(X, PList), assert(recP(X))),
    write("Choose from the following interests (when all intersted codes entered type done)"), nl, 
    write("22 - Sports"), nl,
    write("23 - Competitive Programming"), nl,
    write("24 - Research"), nl,
    write("25 - Management"), nl,
    write("26 - Civil Services"), nl,
    write("27 - Writing"), nl,
    write("28 - Photography"), nl,
    write("29 - Drawing"), nl,
    getInterest(IList), 
    forall(member(Elem, IList), assert(recI(Elem))), nl,
    go2, retractall(recG(_)), retractall(recP(_)), retractall(recI(_)).

getInterest([ICode|Tail]):-
    write("Enter code of what you are interested in "), read(ICode), 
    dif(ICode, done), getInterest(Tail).

getInterest([]).
  
getGrades([[SCode,Grade]|Tail]) :- write("Enter code "), read(SCode), write("Enter grade "), read(Grade), 
    dif(SCode, done), getGrades(Tail).

getGrades([]).

getProgrammingLang([PCode|Tail]) :-
    write("Enter code of language you know "), read(PCode), dif(PCode, done), getProgrammingLang(Tail).

getProgrammingLang([]).

go2:-
    suggest(Job), assert(rec(Job)), fail.

go2:-
    convert_to_list(List), dif(List, []), write('The list of recommended carrers for you is '),
    write(List), nl.

go2:-
    write("Sorry I am not able to suggest a suitable carrer.").

convert_to_list([Px|Tail]):- retract(rec(Px)), convert_to_list(Tail).

convert_to_list([]).

% front end web Development if DSA and AP and Javascript and (HTML or CSS) or Competitive Programming 
suggest(" Front-End Web Developer ") :- ( (recG([1, a]); recG([1, b])), (recG([2, a]); recG([2, b])), recP(18), (recP(19);recP(20)) ); recI(23).

% back-end if FDMS and SQL and(java or python or c++ or Javascript) or Competitive Programming 
suggest(" Back-End Web Developer "):- ( (recG([3,a]); recG([3,b])), recP(14), (recP(15); recP(16); recP(17); recP(18)) ) ; recI(23).

% data analyst if (FDMS and SQL) or Management
suggest(" Data Analyst ") :- ((recG([3, a]); recG([3, b])), recP(14)); recI(25).

% network engineer if computer network
suggest(" Network Engineer "):- recG([4,a]); recG([4,b]).

% grapic/ui designer if desing drawing and interactive systems or drawing interest
suggest(" Graphic/UI/UX Designer ") :- ((recG([5, a]);recG([5, b])), (recG([6, a]) ;recG([6, b]))) ; recI(29).

% biotech if genetics and bioinformatics 
suggest(" Biotechnology Engineer ") :- (recG([7,a]); recG([7,b])), (recG([8, a]) ;recG([8, b])).

% cyber Security if Cryptography
suggest(" Cyber Security Analyst "):- recG([9,a]); recG([9,b]).

% ML/AI if ML and AI and (Python or prolog)
suggest(" ML/AI Engineer ") :- (recG([10,a]); recG([10,b])), (recG([11,a]); recG([11,b])) ,(recP(21); recP(16)).

% Journalist if photography or Writing
suggest(" Journalist ") :- recI(27); recI(28).

% MBA if management
suggest(" MBA "):- recI(25).

% higher studies in ai/ml if interest in research and qualification for ai/ml engineer met
suggest(" Higher Studies in AI/ML ") :- recI(24), suggest(" ML/AI Engineer ").

suggest(" Higher Studies in Genetics ") :- recI(24), suggest(" Biotechnology Engineer ").

suggest(" Higher Studies in CyberSecurity "):- recI(24), suggest(" Cyber Security Analyst ").

suggest(" UPSC exam for Civil Services ") :- recI(26).     % interest in civil Services

suggest(" Sportsperson ") :- recI(22).                     % interest in sports

% start-up if minor in Entrepreneurship
suggest(" Start-Up ") :- recG([12, a]); recG([12, b]); recG([12, c]).

% economist if minor in economics
suggest(" Economist ") :- recG([13, a]); recG([13, b]); recG([13,c]).








/*getGrades(Code,Grade):-
    subject(Code, X), write("Enter you grade for subject "), write(X), nl,
    read(Grade),dif(Grade, na), gradeCheck(Grade), assert(recG(Code,Grade)), fail.

gradeCheck(Grade) :-
    Grade = a; Grade = b.

getGrades(_,_):- 
    suggest(Job), write(Job), nl, assert(rec(Job)), fail.*/

/*getGrades(SCode,Grade):-
    write("Enter code"), read(SCode), write("Enter grade"), read(Grade), assert(rec([SCode, Grade])), fail.*/
