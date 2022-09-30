# Installing and executing Apache Jena Fuseki server.

<p align="justify">
Download the latest version of Apache Jena Fuseki server from <a href="https://jena.apache.org/download/index.cgi">this link</a>. The experiments described in this repository have been executed with Apache Jena Fuseki v4.6.1.
</p>

<p align="justify">
After that, you must upload a <i>single</i> file in the CORPUS on Apache Jena Fuseki and make it available at the SPARQL endpoint "ABox". Therefore, to run the experiments you must upload the files one by one.
</p>

<p align="justify">
The file runFuseki.bat contains the instructions to do so on Windows. For instance:
</p>

<p align="center">
java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_450-500_Probability50.owl /ABox
</p>
