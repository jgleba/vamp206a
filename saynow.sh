#!/usr/bin/env bash

saynow()
{
# works.
date +"__%Y-%m-%d_%a_%k.%M.%S-%Z"
date +"%Y-%m-%d_%k-%M-%S"
date +"%s"
echo $(date +"__%Y-%m-%d_%a_%k.%M.%S-%Z")

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
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#main...

saynow
#

