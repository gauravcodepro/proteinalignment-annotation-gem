# proteinalignment-annotation-gem

- a set of ruby class encoded functions, which i am converting into a gem for doing everything that you can do with the protein alignments. You can index all the protein alignments, extract the regions of interest, extract the locus, extract the dimensions.
- a proteinalignment gem that uses the red data tools and gives all information on the protein alignments for genome annotations.
- it will take the sample gff and then will write the filemodified.txt
- will use the filemodified.txt again as buffer read and then will make and give all the information including the plots for the visualization.
- has all the support for the paf alignment and the gff alignments coming from the miniprot.
- sample files to generate the alignment are present in the repository.
- example usage
  ```
  # after initiating the class constructor
  getcorrdinates("/home/gaurav/Desktop/sample.gff", "/home/gaurav/Desktop/sample.txt", type = "mRNA")
  ```
- it also has the visualization support for the plotting differences.

Gaurav Sablok \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany
