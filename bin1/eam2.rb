# usage :  echo %time% && ruby 10.rb | grep -v Warning > \0\out10.csv 
#          echo %time% 
# usage :  ruby 10.rb | grep  Warning > \0\warn10.csv


infile='c:\0\in.txt'
infile='in.txt'
infile=ARGV[0]

# define arrays
head=data=label=aline=[]
vflag=1
vcount=1

#puts 'id,date,time,Nom,Act,Dev,LwTol,UpTol,Trend,feat,feat2'

#http://stackoverflow.com/questions/17883896/how-do-i-read-a-text-file-into-an-array-of-array-each-sub-array-being-a-row-in
  # read the infile and split into arrays of arrays... 
  File.foreach(infile).with_object([]) do |line, result|
    # aline = the line split into an array
    #aline = line.split.map(&:to_s)

    lineb='"",'+line

    if vcount==2
    4.times {print '"~~~~~~~~~~~~~~~~~~~~~~~",'}do
      puts '"~~~~~~~~~~~~~~~~~~~~~~~"'
    end
    vcount += 1
    
  end  
    