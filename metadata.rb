name             'hiway'
maintainer       "Marc Bux"
maintainer_email "bux@informatik.hu-berlin.de"
license          "Apache 2.0"
description      'Installs/Configures Hiway and several test workflows'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0"

recipe           "hiway::hadoop", "Configures Hadoop to be able to locate Hi-WAY's jar files"
recipe           "hiway::install", "Installs and sets up Hi-WAY"
recipe           "hiway::galaxy", "Sets up Galaxy and installs additional tools from the tool shed"
recipe           "hiway::wordcount_cf", "Sets up and runs a basic Cuneiform workflow on Hi-WAY that counts the occurence of words in text files"
#recipe           "hiway::variantcall_cf_tools", "Installs the tool dependencies for the variantcall.cf workflow"
#recipe           "hiway::variantcall_cf", "Sets up and runs an elaborate Cuneiform workflow on Hi-WAY that processes sequencing data from the 1000 Genomes project"
recipe           "hiway::montage_synthetic_dax", "Sets up and runs a synthetic Pegasus workflow on Hi-WAY that was generated by the Pegasus workflow generator"
#recipe           "hiway::montage_m17_4_dax_tools", "Installs the tool dependencies for the montage_m17_4.dax workflow"
#recipe           "hiway::montage_m17_4_dax", "Sets up and runs an elaborate Pegasus workflow on Hi-WAY that assembles a mosaic of the sky from raw image data"
#recipe           "hiway::galaxy101_ga]", "Sets up and runs a basic Galaxy workflow on Hi-WAY that is based on the Galaxy 101 tutorial"
#recipe           "hiway::RNASeq_ga", "Sets up and runs an elaborate Galaxy workflow on Hi-WAY that processes RNA sequencing data"

depends 'hadoop'

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "hadoop/version",
:display_name => "Hadoop version",
:description => "Version of hadoop",
:type => 'string',
:default => "2.4.0"
