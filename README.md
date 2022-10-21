# Compliance checking on RDF data

<p align="justify">
This GitHub repository contains source code to compare two legal reasoners on <a href="https://www.w3.org/RDF">Resource Description Framework (RDF)</a> data. The first legal reasoner is based on the <a href="https://www.w3.org/TR/shacl-af/#rules">Shapes Constraint Language (SHACL)</a>, the second one is based on the <a href="https://dlv.demacs.unical.it/">DLV2</a> automated reasoner for <a href="https://www.cambridge.org/core/journals/theory-and-practice-of-logic-programming/article/abs/aspcore2-input-language-format/292E52334010C1F62E4469ABCD66228E">ASP-Core-2</a>.
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
  <li>Executables and instructions for the DLV2 implementation are available <a href="https://github.com/liviorobaldo/compliancecheckingOnRDF/tree/main/DLV2">at this link</a>.</li>
</ul>

</p>

<p align="justify">
The implementations have been tested on the synthetic (ABox) datasets available in the subfolder CORPUS. Further corpora may be created via the dataset generator available <a href="https://github.com/liviorobaldo/compliancecheckers/tree/main/DatasetGenerator">at this link</a>.
</p>

<p align="justify">
The fuseki server, configured to upload the files in CORPUS and make them available as a SPARQL endpoint on localhost, is available in the subfolder FUSEKI.
</p>


## How to run the experiments
Experiments have been executed on a Linux machine running Ubuntu 22.04.1 LTS equipped with <i>Intel® Core™ i7-9750H</i> CPU and <i>32GB</i> of RAM.

Experiments can be also replicated using Ubuntu Bash on a Windows machine or a standard terminal on MacOS. The Ubuntu Bash for Windows can be downloaded from the Windows Store <a href="https://apps.microsoft.com/store/detail/ubuntu-22041-lts/9PN20MSR04DW">at this link.</a>

In order to run all the experiments the following steps must be performed
<ol>
<li>Open a terminal or the Ubuntu Bash</li>
<li>Move inside the experiments <i>root</i> experiments folder</br>
<ul>
  <li>On Linux: <code>cd path/to/compliancecheckingOnRDF</code></li>
  <li>On Windows (if the folder is located on your <b>Desktop</b>): <code>cd /mnt/c/Users/&lt;YOUR_WINDOWS_USERNAME&gt;/Desktop/compliancecheckingOnRDF</code></li>
  
</ul>
<li>Run the experiments executing the following commands one by one</li>
<ul>
  <li><code>sh runFuseki_DLV2_SHACL.sh dlv2 2>/dev/null</code></li>
  <li><code>sh runFuseki_DLV2_SHACL.sh shacl 2>/dev/null</code></li>
  <li><code>sh runLocal_DLV2_SHACL.sh dlv2 2>/dev/null</code></li>
  <li><code>sh runLocal_DLV2_SHACL.sh shacl 2>/dev/null</code></li>
</ul>
<li><b>ALTERNATIVELY</b>, all the experiments can be executed running the following way
<ul>
  <li>To print the results on <code>stdout</code> execute
  <pre><code>sh runAll.sh</code></li></pre>
  <li>To print the results on a <code>csv</code> file called <code>results_all.csv</code> execute
  <pre><code>sh runAll.sh > results_all.csv</code></li></pre>
</ul>
</li>

</ol>
