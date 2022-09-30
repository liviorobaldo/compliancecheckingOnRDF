# SHACL legal reasoner

<p align="justify">
This folder contains the two implementations of the legal reasoner based on SHACL.

<ul>
  <li>The subfolder <b>SHACL_files</b> contains the implementation that checks compliance of the legal rules on the files in the CORPUS.</li>
  <li>The subfolder <b>SHACL_fuseki</b> contains the implementation that checks compliance of the legal rules on SPARQL endpoint opened via Apache Jena Fuseki.</li>
</ul>
</p>

<p align="justify">
The legal rules are encoded within the file <i>regulativerules.ttl</i>. Both subfolders include a copy of this file. All other files in the subfolder are needed for the execution. In particular, the Java file in each subfolder is the one that must be executed in order to check compliance. The subfolder also include bat files to compile and run the Java file on Windows. The Java files output the results of the compliance checks, together with the execution time, in the files <i>evaluationSHACLonfiles.txt</i> and <i>evaluationSHACLonSparqlEndpoint.txt</i>.
</p>

<p align="justify">
The implementations can be tested on the synthetic (Abox) datasets created via the dataset generator <a href="https://github.com/liviorobaldo/compliancecheckers/tree/main/DatasetGenerator">at this link</a>.
</p>
