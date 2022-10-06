# SHACL legal reasoner

<p align="justify">
This folder contains the two implementations of the legal reasoner based on SHACL.

<ul>
  <li>The subfolder <b>SHACL_files</b> contains the implementation that checks compliance of the legal rules on the files in the CORPUS.</li>
  <li>The subfolder <b>SHACL_fuseki</b> contains the implementation that checks compliance of the legal rules on the SPARQL endpoint opened in localhost via Apache Jena Fuseki.</li>
</ul>
</p>

<p align="justify">
The legal rules are encoded within the file <i>regulativerules.ttl</i>. Both subfolders include a copy of this file. All other files in the subfolder are needed for the execution. In particular, the Java file in each subfolder is the one that must be executed in order to perform the compliance check. The subfolders also include bat files to compile and run the Java files on Windows. The two Java files output the results of the compliance checks, together with the execution time, in  <i>evaluationSHACLonfiles.txt</i> and <i>evaluationSHACLonSparqlEndpoint.txt</i> respectively.
</p>

<p align="justify">
  Specifically, the following instruction runs the Java file <i>DetectViolationsOnCorpus.class</i> in SHACL_files on Windows:
</p>

<p align="center">
  <i>java -cp .;./lib/* -Dfile.encoding=utf-8 DetectViolationsOnCorpus "licenceusecaseTBox.owl" "riolOntology.owl" "regulativerules.ttl" "compliancerules.ttl" "../../CORPUS" "../../evaluationSHACLonfiles.txt"</i>
</p>

<p align="justify">
While the following instruction runs the Java file <i>fusekiSparqlEndpointClient.class</i> in SHACL_fuseki on Windows. The files in CORPUS must be uploaded in Fuseki one by one; the instruction below refers to the file <i>rdfABox_Size50_Probability50.owl</i>
</p>

<p align="center">
  <i>java -cp .;./lib/* -Dfile.encoding=utf-8 fusekiSparqlEndpointClient "licenceusecaseTBox.owl" "riolOntology.owl" "regulativerules.ttl" "compliancerules.ttl" "rdfABox_Size100_Probability50.rdf" >> "../../evaluationSHACLonSparqlEndpoint.txt"</i>
</p>
