#!/usr/bin/ruby
# Author Gaurav Sablok
# Universitat Potsdam
# Date 2024-4-4
   # a ruby gem for all the alignment and the pattern
   # extracttion from the alignments. It plots also the
   # alignment length and also a three dimensional plot
   # using the mRNA, cds, stop positions. complete support
   # for the protein annotations and the alignment of the genome
   # to the proteins and generation of the hints for the genome
   # annotations.

gem install gr-plot
require 'gr/plot'


class ProteinAlignment


 def initialize(alignmentfile, writemodifiedbuffer)
   @alignment = alignmentfile
   @modifiedbuffer = writemodifiedbuffer
   readfile = File.open(@alignment).readlines
   writefile = File.new(writemodifiedbuffer, "w")
   writefile.puts(readfile[2..readfile.length])
   writefile.close
 end 
 
 def getcorrdinates(inputfile, outputfile, type)
  if type == "mRNA"
    columnread = []
    start_cor = []
    end_cor = []
    readfile = File.open(inputfile).readlines
    writefile = File.new(outputfile, "w")
    writefile.puts(readfile[2..readfile.length])
    writefile.close
    fileopen = File.open(writefile)
    fileopen.each { | iter | columnread.push(iter.strip().split()[2]) }
    fileopen.each { | iter | start_cor.push(iter.strip().split()[3]) }
    fileopen.each { | iter | end_cor.push(iter.strip().split()[4])}
    mRNA = []
    for i in 0..columnread.length
       mRNA.push([columnread[i].to_s,start_cor[i].to_i,end_cor[i].to_i]) if columnread[i]=="mRNA"
    end
    return mRNA
  end
  if type == "CDS"
    columnread = []
    start_cor = []
    end_cor = []
    readfile = File.open(inputfile).readlines
    writefile = File.new(outputfile, "w")
    writefile.puts(readfile[2..readfile.length])
    writefile.close
    fileopen = File.open(writefile)
    fileopen.each { | iter | columnread.push(iter.strip().split()[2]) }
    fileopen.each { | iter | start_cor.push(iter.strip().split()[3]) }
    fileopen.each { | iter | end_cor.push(iter.strip().split()[4])}
    cds = []
    for i in 0..columnread.length
       cds.push([columnread[i].to_s,start_cor[i].to_i,end_cor[i].to_i]) if columnread[i]=="CDS"
    end
    return mRNA
  end
  if type == "stop_codon"
    columnread = []
    start_cor = []
    end_cor = []
    readfile = File.open(inputfile).readlines
    writefile = File.new(outputfile, "w")
    writefile.puts(readfile[2..readfile.length])
    writefile.close
    fileopen = File.open(writefile)
    fileopen.each { | iter | columnread.push(iter.strip().split()[2]) }
    fileopen.each { | iter | start_cor.push(iter.strip().split()[3]) }
    fileopen.each { | iter | end_cor.push(iter.strip().split()[4])}
    stop_codon = []
    for i in 0..columnread.length
       stop_codon.push([columnread[i].to_s,start_cor[i].to_i,end_cor[i].to_i]) if columnread[i]=="stop_codon"
    end
    return mRNA
  end
end

 def plotmRNAs(inputfile, outputfile)
    if start == "mRNA"
    columnread = []
    start_cor = []
    end_cor = []
    fileopen = File.open(inputfile).readlines
    writefile = File.new(outputfile, "w")
    writefile.puts(readfile[2..readfile.length])
    writefile.close
    fileopen = File.open(writefile)
    fileopen.each { | iter | columnread.push(iter.strip().split()[2]) }
    fileopen.each { | iter | start_cor.push(iter.strip().split()[3]) }
    fileopen.each { | iter | end_cor.push(iter.strip().split()[4])}
    mRNA = []
    mRNA_start = []
    mRNA_end = []
    mRNA_difference = []
    for i in 0..columnread.length
       mRNA.push([columnread[i].to_s,start_cor[i].to_i,end_cor[i].to_i]) if columnread[i]=="mRNA"
    end
    for i in 0..columnread.length
       mRNA_start.push(start_cor[i].to_i) if columnread[i]=="mRNA"
    end
    for i in 0..columnread.length
       mRNA_end.push(end_cor[i].to_i) if columnread[i]=="mRNA"
    end
    for i in 0..mRNA_start.length
        mRNA_difference.push(mRNA_end[i].to_i - mRNA_start[i].to_i)
    end
    GR.barplot(mRNA_difference)
 end

 def plotCDS(inputfile, outputfile)
    if start == "CDS"
    columnread = []
    start_cor = []
    end_cor = []
    fileopen = File.open(inputfile).readlines
    writefile = File.new(outputfile, "w")
    writefile.puts(readfile[2..readfile.length])
    writefile.close
    fileopen = File.open(writefile)
    fileopen.each { | iter | columnread.push(iter.strip().split()[2]) }
    fileopen.each { | iter | start_cor.push(iter.strip().split()[3]) }
    fileopen.each { | iter | end_cor.push(iter.strip().split()[4])}
    cds = []
    cds_start = []
    cds_end = []
    cds_difference = []
    for i in 0..columnread.length
       cds.push([columnread[i].to_s,start_cor[i].to_i,end_cor[i].to_i]) if columnread[i]=="CDS"
    end
    for i in 0..columnread.length
       cds_start.push(start_cor[i].to_i) if columnread[i]=="CDS"
    end
    for i in 0..columnread.length
       cds_end.push(end_cor[i].to_i) if columnread[i]=="CDS"
    end
    for i in 0..mRNA_start.length
        cds_difference.push(cds_end[i].to_i - cds_start[i].to_i)
    end
    return GR.barplot(cds_difference)
 end

 def plotstop(inputfile, outputfile)
    if start == "stop_codon"
    columnread = []
    start_cor = []
    end_cor = []
    fileopen = File.open(inputfile).readlines
    writefile = File.new(outputfile, "w")
    writefile.puts(readfile[2..readfile.length])
    writefile.close
    fileopen = File.open(writefile)
    fileopen.each { | iter | columnread.push(iter.strip().split()[2]) }
    fileopen.each { | iter | start_cor.push(iter.strip().split()[3]) }
    fileopen.each {   iter | end_cor.push(iter.strip().split()[4])}
    stop = []
    stop_start = []
    stop_end = []
    stop_difference = []
    for i in 0..columnread.length
       stop.push([columnread[i].to_s,start_cor[i].to_i,end_cor[i].to_i]) if columnread[i]=="stop_codon"
    end
    for i in 0..columnread.length
       stop_start.push(start_cor[i].to_i) if columnread[i]=="stop_codon"
    end
    for i in 0..columnread.length
       stop_end.push(end_cor[i].to_i) if columnread[i]=="stop_codon"
    end
    for i in 0..mRNA_start.length
       stop_difference.push(stop_end[i].to_i - stop_start[i].to_i)
    end
    GR.barplot(stop_difference)
 end

  def 3D()
    GR.scatter3(mRNA_differences,cds_differences. stop_codon_differences)
  end
 end
