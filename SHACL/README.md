# SHACL legal reasoner

<p align="justify">
This folder contains the two implementations of the legal reasoner based on SHACL.

<ul>
  <li>The subfolder <b>SHACL_files</b> contains the implementation that checks compliance of the legal rules on the files in the CORPUS.</li>
  <li>The subfolder <b>SHACL_fuseki</b> contains the implementation that checks compliance of the legal rules on the SPARQL endpoint opened in localhost via Apache Jena Fuseki.</li>
</ul>
</p>

<p align="justify">
The legal rules are encoded within the file <code>regulativerules.ttl</code>. Both subfolders include a copy of this file. All other files in the subfolder are needed for the execution. In particular, the Java file in each subfolder is the one that must be executed in order to perform the compliance check. The two Java files output the results of the compliance checks on standard output <code>stdout</code>.
</p>

<p align="justify">
  Specifically, the following instruction runs the Java file <code>DetectViolationsOnCorpus.class</code> in SHACL_files:
</p>

<pre><code>java -cp .:./lib/* -Dfile.encoding=utf-8 DetectViolationsOnCorpus "licenceusecaseTBox.owl" "riolOntology.owl" "regulativerules.ttl" "compliancerules.ttl" "../../CORPUS/rdfABox_Size50_Probability50.ttl"</code></pre>

<p align="justify">
While the following instruction runs the Java file <code>fusekiSparqlEndpointClient.class</code> in SHACL_fuseki. The files in CORPUS must be uploaded in Fuseki one by one; the instruction below refers to the file <code>rdfABox_Size50_Probability50.ttl</code>
</p>

<pre><code>java -cp .:./lib/* -Dfile.encoding=utf-8 fusekiSparqlEndpointClient "licenceusecaseTBox.owl" "riolOntology.owl" "regulativerules.ttl" "compliancerules.ttl" "../../CORPUS/rdfABox_Size50_Probability50.ttl"</code></pre>

