import org.apache.jena.util.iterator.*;
import java.util.*;
import java.io.*;
import org.apache.jena.rdf.model.*;
import org.apache.jena.util.FileUtils;
import org.apache.jena.ontology.*;

import org.apache.jena.rdfconnection.*;
import org.apache.jena.query.*;

/**/
    //INTERESSANTE!!! QUESTI SONO DI TopBraid, NON DI JENA!
    //Ho provato ad usare quelle di Jena, ma non sono riuscito, sollevavano un vespaio di eccezioni...
import org.topbraid.jenax.util.JenaUtil;
import org.topbraid.shacl.rules.RuleUtil;
/**/

public class fusekiSparqlEndpointClient 
{
        //RICORDA SEMPRE: SHACL È SOLO PER VALIDARE RDF, NON OWL!!! SHACL è UN'ESTENSIONE DI RDF, NON DI OWL!!!
    public static void main(String[] args) throws Exception 
    {
            //Loading the TBox and the rules, as in the corpus-based version.
        File TBoxFile = new File("licenceusecaseTBox.owl");
        File riolOntologyFile = new File("riolOntology.owl");
        File regulativeRulesFile = new File("regulativerules.ttl");
        File complianceRulesFile = new File("compliancerules.ttl");
        String datasetName = "ABox.owl";
        
        if(args.length>0)
        {
            TBoxFile = new File(args[0]);
            riolOntologyFile = new File(args[1]);
            regulativeRulesFile = new File(args[2]);
            complianceRulesFile = new File(args[3]);
            datasetName = args[4];
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
        
            //We upload the ABox, by querying the Fuseki server via SPARQL.
            //Since this requires several queries, we do it in the sub-procedure.
        Model ontology = loadABoxFromFuseki().add(TBox).add(riolOntology);
        
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

        Resource Violation = inferredModel.getResource("https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Violation");
        Property rdfType = inferredModel.getProperty("http://www.w3.org/1999/02/22-rdf-syntax-ns#type");
        Property referTo = inferredModel.getProperty("https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#refer-to");
        List<Resource> violations = inferredModel.listSubjectsWithProperty(rdfType, Violation).toList();
        int counterViolations = 1;

        System.out.println("------------------------------------------------------------------------------------------------------------------------------------------------");
        System.out.println(violations.size()+" violations found for dataset "+datasetName);
        System.out.println("TIME: "+time+"s");
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

    private static Model loadABoxFromFuseki()
    {
        Model ontology = JenaUtil.createMemoryModel();

            //Instances of the TBox classes
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Evaluate");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Grant");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Publish");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Approve");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Commission");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Remove");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Licensee");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Licensor");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Product");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Result");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Licence");
        loadRdfClassInstances(ontology, "http://www.licenceusecaseonto.org/", "Comment");
        
            //Relations among instances of the TBox classes
        loadRelationsAmongTwoInstances(ontology, "has-agent");
        loadRelationsAmongTwoInstances(ontology, "has-theme");
        loadRelationsAmongTwoInstances(ontology, "has-receiver");
        loadRelationsAmongTwoInstances(ontology, "has-result");
        loadRelationsAmongTwoInstances(ontology, "is-licence-of");
        loadRelationsAmongTwoInstances(ontology, "is-comment-of");
        /**/
        
            //Rexist instances
        loadRdfClassInstances(ontology, "https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#", "Rexist");
        /**/
        
        return ontology;
    }
    
    //https://stackoverflow.com/questions/3975425/how-can-i-add-some-triple-to-my-ontology-by-jena
    private static void loadRdfClassInstances(Model ontology, String emptyPrefix, String RDFclass)
    {
        String queryString =
            "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> "+
            "PREFIX : <"+emptyPrefix+"> "+
            "SELECT ?x WHERE {?x rdf:type :"+RDFclass+".}";
        Query query = QueryFactory.create(queryString);
        
        RDFConnection conn = RDFConnection.connect("http://localhost:3030/ABox");
        
        try(QueryExecution qexec = conn.query(query))
        {
            ResultSet results = qexec.execSelect() ;

            for(;results.hasNext();)
            {
                QuerySolution soln = results.nextSolution();
                RDFNode x = soln.get("x");

                Resource instance = ontology.createResource(x.toString().trim());
                Property rdfType = ResourceFactory.createProperty("http://www.w3.org/1999/02/22-rdf-syntax-ns#", "type");
                instance.addProperty(rdfType, ontology.createResource(emptyPrefix+RDFclass));
            }
        }
    }
    
    private static void loadRelationsAmongTwoInstances(Model ontology, String RDFproperty)
    {
        String queryString =
            "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> "+
            "PREFIX : <http://www.licenceusecaseonto.org/> "+
            "SELECT ?x ?y WHERE {?x :"+RDFproperty+" ?y.}";
        Query query = QueryFactory.create(queryString);

        RDFConnection conn = RDFConnection.connect("http://localhost:3030/ABox");
        
        Property rdfProperty = ResourceFactory.createProperty("http://www.licenceusecaseonto.org/"+RDFproperty);
        try(QueryExecution qexec = conn.query(query))
        {
            ResultSet results = qexec.execSelect() ;

            for(;results.hasNext();)
            {
                QuerySolution soln = results.nextSolution();
                RDFNode x = soln.get("x");
                RDFNode y = soln.get("y");

                Resource instance1 = ontology.createResource(x.toString().trim());
                Resource instance2 = ontology.createResource(y.toString().trim());
                instance1.addProperty(rdfProperty, instance2);
            }
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
            if(inferredModel.listObjectsOfProperty(individual, hasTheme).toList().get(0).toString()==result.toString())
                return individual;
        }
        throw new Exception("Cannot find the publish associated with the remove.");
    }
}