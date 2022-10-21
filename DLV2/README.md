# DLV2 reasoner

<p align="justify">
This folder contains the <b>DLV2</b> binaries along with all the ASP encodings used to checks compliance of the states of affairs with respect to the legal norms.

<ul>
  <li>The <code>dlv2SparqlABoxEndpoint.asp</code> file contains the import directives needed to connect to the Fuseki server which makes an ABox available at the SPARQL endpoint called, in example, "ABox".
  </li>
  <li>The <code>rules_remote.asp</code> and <code>rules_local.asp</code> files encode rules which are needed to check compliance of the legal rules on the files in the CORPUS. The two encodings differ only by the name of the predicates in the rules and are used for the remote or local import of the ABox, respectively. 
  </li>
</ul>
</p>

<p align="justify">
  Specifically, the following command runs DLV2 uploading, in example, the <code>../CORPUS/rdfABox_Size50_Probability50.ttl</code> file:
</p>

<pre><code>./dlv2 rules_local.asp ../CORPUS/rdfABox_Size50_Probability50.ttl</code></pre>

<p align="justify">
While the following command runs DLV2 allowing to import the ABox from a remote server (e.g., the fuseki server). The files in CORPUS must be uploaded in Fuseki one by one; the instruction below refers to the file <code>rdfABox_Size50_Probability50.ttl</code>
</p>

<pre><code>./dlv2 dlv2SparqlABoxEndpoint.asp rules_remote.asp </code></pre>

