user:file_search_path(srv, '/srv').
user:file_search_path(tmp, '/tmp').

:- set_prolog_flag(verbose_load, full).
:- load_settings(tmp('settings.pl')), at_halt(save_settings).
:- expand_file_name('*-settings.pl', A), forall(member(B, A), load_settings(B, [undefined(load)])).
:- expand_file_name('prolog/*.pl', A), sort(A, B), load_files(B).
