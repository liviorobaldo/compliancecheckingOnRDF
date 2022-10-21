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
        // DEFAULT VALUES
        File TBoxFile = new File("licenceusecaseTBox.owl");
        File riolOntologyFile = new File("riolOntology.owl");
        File regulativeRulesFile = new File("regulativerules.ttl");
        File complianceRulesFile = new File("compliancerules.ttl");
        File ABoxFile = new File("../../CORPUS/rdfABox_Size50_Probability50.ttl");
        
        if(args.length>0)
        {
            TBoxFile = new File(args[0]);
            riolOntologyFile = new File(args[1]);
            regulativeRulesFile = new File(args[2]);
            complianceRulesFile = new File(args[3]);
            ABoxFile = new File(args[4]);
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
 
             
        long startTime = System.currentTimeMillis();

            //Load the whole ontology (Load the ABox and add the riolOntology and the TBox to it)
        Model ontology = JenaUtil.createMemoryModel();
        FileInputStream fisAB = new FileInputStream(ABoxFile);
        //ontology.read(ABoxFile.getAbsolutePath()).add(TBox).add(riolOntology);//su RDF/XML usa questa!
        ontology.read(fisAB, "urn:dummy", FileUtils.langTurtle).add(TBox).add(riolOntology);//su Turtle usa questa!
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

        
        System.out.println("------------------------------------------------------------------------------------------------------------------------------------------------");
        System.out.println(violations.size()+" violations found for dataset "+ABoxFile.getAbsolutePath());
        for(Resource v:violations)
        {
            System.out.println();
            System.out.println("\tViolation #"+counterViolations);counterViolations++;
            

            Resource violated = inferredModel.listObjectsOfProperty(v, referTo).next().asResource();
            System.out.println("\t\tRESOURCE NAME: "+violated);
            System.out.println("\t\tRESOURCE CLASSES:");
            
            
            List<RDFNode> classesOfViolated = inferredModel.listObjectsOfProperty(violated, rdfType).toList();
            for(RDFNode classOfViolated:classesOfViolated)
            {
                if(classOfViolated.toString().indexOf("NamedIndividual")!=-1)continue;
                System.out.println("\t\t\t"+classOfViolated);
                
                if(classOfViolated.toString().indexOf("Remove")!=-1)
                    System.out.println("\t\t\tFORBIDDEN PUBLISH: "+getAssociatedPublishing(inferredModel, violated));
            }
        }
        System.out.flush();
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