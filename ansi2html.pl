#!/usr/bin/env perl
###############################################################################
# Copyright (C) 2006 Tetsuya Kimata <kimata@acapulco.dyndns.org>
#
# All rights reserved.
#
# This software is provided 'as-is', without any express or implied
# warranty.  In no event will the authors be held liable for any
# damages arising from the use of this software.
#
# Permission is granted to anyone to use this software for any
# purpose, including commercial applications, and to alter it and
# redistribute it freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must
#    not claim that you wrote the original software. If you use this
#    software in a product, an acknowledgment in the product
#    documentation would be appreciated but is not required.
#
# 2. Altered source versions must be plainly marked as such, and must
#    not be misrepresented as being the original software.
#
# 3. This notice may not be removed or altered from any source
#    distribution.
#
# $Id: ansi2html.pl 2003 2006-11-13 13:42:49Z svn $
###############################################################################

# http://cypresslin.web.fc2.com/Memo/M-EscCharANSI.html
my %color = (
    "1;31"  => 'bold_red',
    "1;32"  => 'bold_green',
    "1;33"  => 'bold_yellow',
    "1;34"  => 'bold_blue',
    "1;35"  => 'bold_magenta',
    "1;36"  => 'bold_cyan',
    "1;37"  => 'bold_white',
    "36"  => 'normal_cyan',
    "32"  => 'normal_green',
    "35"  => 'normal_magenta',
);

print <<"__HTML__";
<!DOCTYPE HTML>
<html>

 <head>
  <meta charset="utf-8">
  <title>$ARGV[0]</title>
  <style type="text/css">
   <!--
   body {
     font-size           : 100%;
     background-color    : rgb(0, 40, 20);
     color               : rgb(187, 187, 187);
   }
   pre {
     font-family         : Consolas, 'Lucida Console', monospace;
     line-height         : 120%;
   }
   span.bold_blue {
     color               : rgb(125, 125, 255);
   }
   span.bold_cyan {
     color               : rgb(85, 85, 255);
   }
   span.bold_green {
     color               : rgb(85, 255, 85);
   }
   span.bold_magenta {
     color               : rgb(255, 85, 255);
   }
   span.bold_red {
     color               : rgb(255, 85, 85);
   }
   span.bold_white {
     color               : rgb(255, 255, 255);
   }
   span.bold_yellow {
     color               : rgb(215, 215, 0);
   }
   span.normal_cyan {
     color               : rgb(0, 187, 187);
   }
   span.normal_green {
     color               : rgb(0, 187, 0);
   }
   span.normal_magenta {
     color               : rgb(187, 0, 187);
   }
   -->
  </style>
 </head>
 <body>
  <pre>
__HTML__

while (<STDIN>) {
    s|\r\n|\n|g;
    s|\033\[0m|</span>|g;
    s|\033\[([01];3[1-7])m|</span><span class="$color{$1}" data-color="$1">|g;
    s|\033\[(3[1-7])m|<span class="$color{'1;' . $1}" data-color="1-$1">|g;
    s|<br>||g;
    print;
}

print <<'__HTML__';
 </pre>
 </body>

</html>
__HTML__

# Local Variables:
# mode: cperl
# coding: euc-japan-unix
# End:
