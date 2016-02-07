#!/usr/bin/env bash

saynow()
{
# works.
date +"__%Y-%m-%d_%a_%k.%M.%S-%Z"   # %k has no leading zero not what I want...
date +"__%Y-%m-%d_%a_%H.%M.%S-%Z"   # %H has leading zero
date +"%Y-%m-%d_%H-%M-%S"
date +"%s"  # seconds since unix epoch
echo $(date +"__%Y-%m-%d_%a_%H.%M.%S-%Z")

#preferred backup format for date...
date +"_%Y.%m.%d_%H.%M.%S.bk"


#gives error
#shc/saynow.sh: line 12: syntax error near unexpected token `date'
#shc/saynow.sh: line 12: `echo (date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")'
#echo (date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
offlinestuff()  
{
echo tmp1
exit 999
# begin block comment =============================
: <<'END'
ls
END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#main...

saynow
#

