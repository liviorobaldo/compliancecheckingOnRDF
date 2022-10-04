REM You need to run the files below one by one, in parallel with the same name of the OWL file used in the client.

cd fuseki

java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size50_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size100_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size150_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size200_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size250_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size300_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size350_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size400_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size450_Probability50.owl /ABox
REM java -Xmx1200M -jar fuseki-server.jar --file ../../CORPUS/rdfABox_Size500_Probability50.owl /ABox

cd..