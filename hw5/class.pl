
topc :- write('Give me a cs class: '), read(c),
        classinfo(c, instructor(I), days(D), times(T)),
        write(I), nl, write(D), nl, write(T), nl.

classinfo(cs311, instructor('Rika Yoshii'), days('TR'), times('1:00-2:15')).
