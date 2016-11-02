
% find class info

% By saying topc or topd, the system begins.
% topc will ask for class, and topd will ask for day(s).
%  You must press a period after your input.

topc :- write('Give me a cs class: '), read(C),
        classinfo(C, instructor(I), days(D), times(T) ),
        write(I), nl, write(D), nl, write(T), nl.
%
topd :- write('Give me the days you want: '), read(D),
        daysinfo(D, class(C), instructor(I), times(T)  ),
        write(C),tab(1), write(I), tab(1), write(T),nl.

% choose rules follow
% cs311
classinfo(C, instructor('Rika Yoshii'), days('TR'), times('1:00-2:15'))
:- C = cs311.
% cs421
classinfo(C, instructor('Rocio Guillen'), days('MW'), times('2:30-3:45'))
:- C = cs421.
% cs512
classinfo(C, instructor('Ahmad hadaegh'), days('TR'), times('4:00-5:15'))
:- C = 512.

% days info

daysinfo(MW, class('571'), instructor('Rika Yoshii'), times('4:00-5:15') ).


daysinfo(TR, class('513'), instructor('Shaun-inn Wu'), times('9:00-10:15') ).


daysinfo(F, class('211'), instructor('Sukendeep Samra'), times('1:30-4:20') ).
