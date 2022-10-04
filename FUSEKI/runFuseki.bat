REM You need to run the files below one by one, in parallel with the same name of the OWL file used in the client.

cd fuseki

java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/shaclABox_Size50_Probability50_num0.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_50-100_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_100-150_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_150-200_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_200-250_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_250-300_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_300-350_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_350-400_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_400-450_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/dlv2sparqlABox_StateOfAffair_450-500_Probability50.owl /ABox

cd..