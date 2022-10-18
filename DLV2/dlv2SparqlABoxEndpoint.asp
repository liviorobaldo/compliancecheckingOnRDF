#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Evaluate.}",evaluate, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Grant.}",grant, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Publish.}",publish, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Approve.}",approve, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Commission.}",commission, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Remove.}",remove, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x ?y WHERE {?x :has-agent ?y.}",hasAgent, 2, type:CONST, CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x ?y WHERE {?x :has-theme ?y.}",hasTheme, 2, type:CONST, CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x ?y WHERE {?x :has-receiver ?y.}",hasReceiver, 2, type:CONST, CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x ?y WHERE {?x :has-result ?y.}",hasResult, 2, type:CONST, CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Licensee.}",licensee, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Licensor.}",licensor, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Product.}",product, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Result.}",result, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Licence.}",licence, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x WHERE {?x rdf:type :Comment.}",comment, 1, type:CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x ?y WHERE {?x :is-licence-of ?y.}",isLicenceOf, 2, type:CONST, CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <http://www.licenceusecaseonto.org/> SELECT ?x ?y WHERE {?x :is-comment-of ?y.}",isCommentOf, 2, type:CONST, CONST).
#import_remote_sparql("http://localhost:3030/ABox","PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX : <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#> SELECT ?x WHERE {?x rdf:type :Rexist.}",rexist, 1, type:CONST).