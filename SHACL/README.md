# SHACL legal reasoner

<p align="justify">
This folder contains the two implementations of the legal reasoner based on SHACL.

<ul>
  <li>The subfolder <b>SHACL_files</b> contains the implementation that checks compliance of the legal rules on the files in the CORPUS.</li>
  <li>The subfolder <b>SHACL_fuseki</b> contains the implementation that checks compliance of the legal rules on SPARQL endpoint opened in localhost via Apache Jena Fuseki.</li>
</ul>
</p>

<p align="justify">
The legal rules are encoded within the file <i>regulativerules.ttl</i>. Both subfolders include a copy of this file. All other files in the subfolder are needed for the execution. In particular, the Java file in each subfolder is the one that must be executed in order to check compliance. The subfolder also include bat files to compile and run the Java file on Windows. The Java files output the results of the compliance checks, together with the execution time, in the files <i>evaluationSHACLonfiles.txt</i> and <i>evaluationSHACLonSparqlEndpoint.txt</i>.
</p>

<p align="justify">
Specifically, the following instruction runs the Java file in SHACL_files on Windows:
</p>

<p align="center">
  <i>java -cp .;./lib/* -Dfile.encoding=utf-8 DetectViolationsOnCorpus "licenceusecaseTBox.owl" "riolOntology.owl" "regulativerules.ttl" "compliancerules.ttl" "../../CORPUS" "../../evaluationSHACLonfiles.txt"</i>
</p>

<p align="justify">
While the following one runs the Java file in SHACL_fuseki on Windows. The files in CORPUS must be uploaded in Fuseki one by one; the instruction below refers to the file <i>dlv2sparqlABox_StateOfAffair_450-500_Probability50.owl</i>
</p>

<p align="center">
  <i>java -cp .;./lib/* -Dfile.encoding=utf-8 fusekiSparqlEndpointClient "licenceusecaseTBox.owl" "riolOntology.owl" "regulativerules.ttl" "compliancerules.ttl" "dlv2sparqlABox_StateOfAffair_450-500_Probability50.owl" >> "../../evaluationSHACLonSparqlEndpoint.txt"</i>
</p>
