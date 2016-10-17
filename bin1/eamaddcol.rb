#!/usr/bin/env ruby

# usage :  echo %time% && cat in1.csv | ruby eam2.rb  > out1.csv
#          echo %time% 

# read stdin or file and process each line with count..

ARGF.each_with_index do |line, vcount|

  if vcount==0
    lineb='"id",'+line
    vcomma_count = lineb.count(',')
    puts lineb      
    vcomma_count.times {print '"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",'}
    puts '"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"'
  else  
    lineb='"",'+line
    puts lineb
  end

end  
    



    