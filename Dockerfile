FROM royratcliffe/swi-prolog:alpine

COPY .config /root/.config

WORKDIR /srv
COPY srv .

# https://www.swi-prolog.org/pldoc/man?section=cmdline
# https://www.swi-prolog.org/pldoc/man?section=initfile
ENTRYPOINT [ "/usr/bin/swipl", "-f", "init.pl" ]
