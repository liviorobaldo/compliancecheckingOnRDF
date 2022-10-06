import org.apache.jena.util.iterator.*;
import java.util.*;
import java.io.*;
import org.apache.jena.rdf.model.*;
import org.apache.jena.util.FileUtils;
import org.apache.jena.ontology.*;

    //INTERESSANTE!!! QUESTI SONO DI TopBraid, NON DI JENA!
    //Ho provato ad usare quelle di Jena, ma non sono riuscito, sollevavano un vespaio di eccezioni...
import org.topbraid.jenax.util.JenaUtil;
import org.topbraid.shacl.rules.RuleUtil;

import org.topbraid.shacl.util.ModelPrinter;

public class DetectViolationsOnCorpus 
{
        //RICORDA SEMPRE: SHACL È SOLO PER VALIDARE RDF, NON OWL!!! SHACL è UN'ESTENSIONE DI RDF, NON DI OWL!!!
    public static void main(String[] args) throws Exception 
    {
        File TBoxFile = new File("licenceusecaseTBox.owl");
        File riolOntologyFile = new File("riolOntology.owl");
        File regulativeRulesFile = new File("regulativerules.ttl");
        File complianceRulesFile = new File("compliancerules.ttl");
        File CORPUS = new File("../AAA_DeployOnGitHub/CORPUS");
        File evaluationReport = new File("../AAA_DeployOnGitHub/evaluationSHACLonfiles.txt");
        
        if(args.length>0)
        {
            TBoxFile = new File(args[0]);
            riolOntologyFile = new File(args[1]);
            regulativeRulesFile = new File(args[2]);
            complianceRulesFile = new File(args[3]);
            CORPUS = new File(args[4]);
            evaluationReport = new File(args[5]);
        }
        
            //Load the riolOntology
        Model riolOntology = JenaUtil.createMemoryModel();
        FileInputStream fisRO = new FileInputStream(riolOntologyFile);
        riolOntology.read(fisRO, "urn:dummy", FileUtils.langTurtle);
        fisRO.close();
        
            //Load the TBox
        Model TBox = JenaUtil.createMemoryModel();
        FileInputStream fisTB = new FileInputStream(TBoxFile);
        TBox.read(fisTB, "urn:dummy", FileUtils.langTurtle);
        fisTB.close();
 
        //System.out.println(ModelPrinter.get().print(TBox));
        
        
        while(evaluationReport.exists())evaluationReport.delete();
        PrintWriter pw = new PrintWriter(new FileWriter(evaluationReport));
        
        
        
            //We order the files according to the size
        ArrayList<File> temp = new ArrayList<File>();
        for(File ABoxFile:CORPUS.listFiles())if(!ABoxFile.isDirectory())temp.add(ABoxFile);
        ArrayList<File> orderedFiles = new ArrayList<File>();
        
        
        while(temp.isEmpty()==false)
        {
            int min=0;
            for(int i=1;i<temp.size();i++)
            {
                String nmin = temp.get(min).getName();
                nmin = nmin.substring("rdfABox_Size".length(), nmin.length()).trim();
                nmin = nmin.substring(0, nmin.indexOf("_")).trim();
                int smin = Integer.parseInt(nmin);
                String ni = temp.get(i).getName();
                ni = ni.substring("rdfABox_Size".length(), ni.length()).trim();
                ni = ni.substring(0, ni.indexOf("_")).trim();
                int si = Integer.parseInt(ni);
                if(si<smin)min=i;
            }
            orderedFiles.add(temp.remove(min));
        }
        
        boolean first = true;
        for(int i=0;i<orderedFiles.size();i++)
        {
            File ABoxFile = orderedFiles.get(i);
            
            long startTime = System.currentTimeMillis();

                //Load the whole ontology (Load the ABox and add the riolOntology and the TBox to it)
            Model ontology = JenaUtil.createMemoryModel();
            FileInputStream fisAB = new FileInputStream(ABoxFile);
            ontology.read(ABoxFile.getAbsolutePath()).add(TBox).add(riolOntology);
            fisAB.close();
            
            /**
            //PRINTING UTILITY
            StmtIterator it = ontology.listStatements();
            while(it.hasNext())
            {
                Statement s = it.nextStatement();
                System.out.println(s);
            }
            /**/

                //Inference regulative rules
            Model regulativerules = JenaUtil.createMemoryModel();
            FileInputStream fisRules = new FileInputStream(regulativeRulesFile);
            regulativerules.read(fisRules, "urn:dummy", FileUtils.langTurtle);
            fisRules.close();
            Model inferredModel = RuleUtil.executeRules(ontology, regulativerules, null, null).add(ontology);

            /**
            //PRINTING UTILITY
            StmtIterator it = inferredModel.listStatements();
            while(it.hasNext())
            {
                Statement s = it.nextStatement();
                System.out.println(s);
            }
            /**/

            Model complianceRules = JenaUtil.createMemoryModel();
            fisRules = new FileInputStream(complianceRulesFile);
            complianceRules.read(fisRules, "urn:dummy", FileUtils.langTurtle);
            fisRules.close();
            inferredModel = RuleUtil.executeRules(inferredModel, complianceRules, null, null).add(inferredModel);

            long stopTime = System.currentTimeMillis();
            double time = (((double)(stopTime-startTime))/1000);

            //System.out.println(ModelPrinter.get().print(inferredModel));

            Resource Violation = inferredModel.getResource("https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Violation");
            Property rdfType = inferredModel.getProperty("http://www.w3.org/1999/02/22-rdf-syntax-ns#type");
            Property referTo = inferredModel.getProperty("https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#refer-to");
            List<Resource> violations = inferredModel.listSubjectsWithProperty(rdfType, Violation).toList();
            int counterViolations = 1;

            if(first==true)
            {
                i--;
                first=false;
                continue;
            }
            
            pw.println("------------------------------------------------------------------------------------------------------------------------------------------------");
            pw.println(violations.size()+" violations found for dataset "+ABoxFile.getAbsolutePath());
            pw.println("TIME: "+time+"s");
            for(Resource v:violations)
            {
                pw.println();
                pw.println("\tViolation #"+counterViolations);counterViolations++;
                

                Resource violated = inferredModel.listObjectsOfProperty(v, referTo).next().asResource();
                pw.println("\t\tRESOURCE NAME: "+violated);
                pw.println("\t\tRESOURCE CLASSES:");
                
                
                List<RDFNode> classesOfViolated = inferredModel.listObjectsOfProperty(violated, rdfType).toList();
                for(RDFNode classOfViolated:classesOfViolated)
                {
                    if(classOfViolated.toString().indexOf("NamedIndividual")!=-1)continue;
                    pw.println("\t\t\t"+classOfViolated);
                    
                    if(classOfViolated.toString().indexOf("Remove")!=-1)
                        pw.println("\t\t\tFORBIDDEN PUBLISH: "+getAssociatedPublishing(inferredModel, violated));
                }
            }
            pw.flush();
        }
    }
    
    private static Resource getAssociatedPublishing(Model inferredModel, Resource violated)throws Exception
    {
        Property rdfType = inferredModel.getProperty("http://www.w3.org/1999/02/22-rdf-syntax-ns#type");
        Property hasTheme = inferredModel.getProperty("http://www.licenceusecaseonto.org/has-theme");
        RDFNode result = inferredModel.listObjectsOfProperty(violated, hasTheme).toList().get(0);
        
        RDFNode Publish = inferredModel.getResource("http://www.licenceusecaseonto.org/Publish");
        ResIterator publishIndividuals = inferredModel.listSubjectsWithProperty(rdfType, Publish);
        while(publishIndividuals.hasNext())
        {
            Resource individual = publishIndividuals.nextResource();
            if(inferredModel.listObjectsOfProperty(individual, hasTheme).toList().get(0)==result)
                return individual;
                //This compares the names... with RDF/XML format, sometimes I have a different object for the same individuals...
            if(inferredModel.listObjectsOfProperty(individual, hasTheme).toList().get(0).toString().compareToIgnoreCase(result.toString())==0)
                return individual;
        }
        throw new Exception("Cannot find the publish associated with the remove.");
    }
}