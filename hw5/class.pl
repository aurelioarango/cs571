
topc :- write('Give me a cs class: '),
        read(c),
        classinfo(c, instructor(I), days(D), times(T)),
        write(I), n1, write(D), n1, write(T), n1.

classinfo(cs311,instructor('Rika Yoshii'),days('TR'),times('1:00-2:15')).
