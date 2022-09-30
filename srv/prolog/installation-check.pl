/*  File:    installation-check.pl
    Author:  Roy Ratcliffe
    Created: Sep 24 2022
    Purpose: Installation Check

Copyright (c) 2022, Roy Ratcliffe, Northumberland, United Kingdom

Permission is hereby granted, free of charge,  to any person obtaining a
copy  of  this  software  and    associated   documentation  files  (the
"Software"), to deal in  the   Software  without  restriction, including
without limitation the rights to  use,   copy,  modify,  merge, publish,
distribute, sublicense, and/or sell  copies  of   the  Software,  and to
permit persons to whom the Software is   furnished  to do so, subject to
the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT  WARRANTY OF ANY KIND, EXPRESS
OR  IMPLIED,  INCLUDING  BUT  NOT   LIMITED    TO   THE   WARRANTIES  OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR   PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS  OR   COPYRIGHT  HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY,  WHETHER   IN  AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM,  OUT  OF   OR  IN  CONNECTION  WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

:- autoload(library(check_installation), [check_installation/0]).

:- use_module(library(settings), [convert_setting_text/3]).

:- initialization(installation_check, program).

%!  installation_check is det.
%
%   Runs an installation check if the environment has
%   `CHECK_INSTALLATION` matches `YES` but skips the check otherwise.

installation_check :-
    (   getenv('CHECK_INSTALLATION', CheckInstallation),
        convert_setting_text(boolean, CheckInstallation, true)
    ->  check_installation
    ;   true
    ).
