# Compliance checking on RDF data

<p align="justify">
This GitHub repository contains source code to compare two legal reasoners on <a href="https://www.w3.org/RDF">Resource Description Framework (RDF)</a> data. The first legal reasoner is based on the <a href="https://www.w3.org/TR/shacl-af/#rules">Shapes Constraint Language (SHACL)</a>, the second one is based on the <a href="https://www.dlvsystem.it/dlvsite/dlv/">DLV v2</a> automated reasoner for <a href="https://www.cambridge.org/core/journals/theory-and-practice-of-logic-programming/article/abs/aspcore2-input-language-format/292E52334010C1F62E4469ABCD66228E">ASP-Core-2</a>.
</p>

<p align="justify">
Specifically, a selected use case of legal norms is formalized both in SHACL and ASP-Core-2 formulae. Then, the formulae are executed through the corresponding reasoner on synthetic states of affairs of increasing size encoded in RDF. The execution checks compliance of the states of affairs with respect to the legal norms. 
</p>

<p align="justify">
This GitHub repository includes source code and instructions to execute the reasoners both when the states of affairs are stored within RDF files and when they are stored within a <a href="https://jena.apache.org/documentation/fuseki2">Apache Jena Fuseki</a> SPARQL endpoint. The implementations detect the violations of the legal norms and store them within an output file, together with the measured execution time.
</p>

<p align="justify">
The use case includes the following four articles:

<ul>
  <li><b>Article 1</b>. The Licensor grants the Licensee a licence to evaluate the Product.</li>
  <li><b>Article 2</b>. The Licensee must not publish the results of the evaluation of the Product without the approval of the Licensor. If the Licensee publishes results of the evaluation of the Product without approval from the Licensor, the material must be removed.</li>
  <li><b>Article 3</b>. The Licensee must not publish comments about the evaluation of the Product, unless the Licensee is permitted to publish the results of the evaluation.</li>
  <li><b>Article 4</b>. If the Licensee is commissioned to perform an independent evaluation of the Product, then the Licensee has the obligation to publish the evaluation results.</li>
</ul>
</p>

<p align="justify">
The two implementations are available at the links below:

<ul>
  <li>Source code and instructions for the SHACL implementation are available <a href="https://github.com/liviorobaldo/compliancecheckingOnRDF/tree/main/SHACL">at this link</a>.</li>
  <li>Source code and instructions for the DLV v2 implementation are available at this link.</li>
</ul>

</p>

<p align="justify">
The implementations have been tested on the synthetic (ABox) datasets available in the subfolder CORPUS. Further corpora may be created via the dataset generator available <a href="https://github.com/liviorobaldo/compliancecheckers/tree/main/DatasetGenerator">at this link</a>.
</p>

<p align="justify">
The fuseki server, configured to upload the files in CORPUS and make them available as a SPARQL endpoint on localhost, is available in the subfolder FUSEKI.
</p>
