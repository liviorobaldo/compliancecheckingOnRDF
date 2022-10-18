
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Article 1. The <http://www.licenceusecaseonto.org/Licensor> grants the <http://www.licenceusecaseonto.org/Licensee> a licence to evaluate the Product.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rule Article 1a %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

prohibited(Ev):- <http://www.licenceusecaseonto.org/Evaluate>(Ev), <http://www.licenceusecaseonto.org/has-agent>(Ev,X), <http://www.licenceusecaseonto.org/Licensee>(X), <http://www.licenceusecaseonto.org/has-theme>(Ev,P), <http://www.licenceusecaseonto.org/Product>(P), not exceptionArt1b(Ev). 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rule Article 1b %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

condition_1(Ev):- <http://www.licenceusecaseonto.org/Evaluate>(Ev), <http://www.licenceusecaseonto.org/has-agent>(Ev,X), <http://www.licenceusecaseonto.org/Licensee>(X), <http://www.licenceusecaseonto.org/has-theme>(Ev,P), <http://www.licenceusecaseonto.org/Product>(P), <http://www.licenceusecaseonto.org/is-licence-of>(L,P), <http://www.licenceusecaseonto.org/Licence>(L), <http://www.licenceusecaseonto.org/has-theme>(Eg,L), <http://www.licenceusecaseonto.org/has-agent>(Eg,Y), <http://www.licenceusecaseonto.org/Licensor>(Y), <http://www.licenceusecaseonto.org/Grant>(Eg), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Eg), <http://www.licenceusecaseonto.org/has-receiver>(Eg,X).

exceptionArt1b(Ev):- condition_1(Ev).

permitted(Ev):- condition_1(Ev).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Article 2. The <http://www.licenceusecaseonto.org/Licensee> must not publish the results of the evaluation of the Product without the approval of the <http://www.licenceusecaseonto.org/Licensor>.
%           If the <http://www.licenceusecaseonto.org/Licensee> publishes results of the evaluation of the Product without approval from the <http://www.licenceusecaseonto.org/Licensor>, 
%           the material must be removed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rule Article 2a and Article 2c %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

condition_2(Ep,X,R):- <http://www.licenceusecaseonto.org/Publish>(Ep), <http://www.licenceusecaseonto.org/has-agent>(Ep,X), <http://www.licenceusecaseonto.org/Licensee>(X), <http://www.licenceusecaseonto.org/has-theme>(Ep,R), <http://www.licenceusecaseonto.org/Result>(R), <http://www.licenceusecaseonto.org/has-result>(Ev,R), <http://www.licenceusecaseonto.org/Evaluate>(Ev), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ev), not exceptionArt2b(Ep), not exceptionArt4a(Ep).

prohibited(Ep):- condition_2(Ep,X,R).

obligatory(ca(Ep,X,R)) :- <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ep),condition_2(Ep,X,R).

<http://www.licenceusecaseonto.org/Remove>(ca(Ep,X,R)) :- <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ep),condition_2(Ep,X,R).

<http://www.licenceusecaseonto.org/has-theme>(ca(Ep,X,R),R) :- <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ep),condition_2(Ep,X,R).

<http://www.licenceusecaseonto.org/has-agent>(ca(Ep,X,R),X) :- <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ep),condition_2(Ep,X,R).

compensate(ca(Ep,X,R),Ep):- <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ep),condition_2(Ep,X,R).
		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rule Article 2b %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

condition_3(Ep):- <http://www.licenceusecaseonto.org/Publish>(Ep), <http://www.licenceusecaseonto.org/has-agent>(Ep,X), <http://www.licenceusecaseonto.org/Licensee>(X), <http://www.licenceusecaseonto.org/has-theme>(Ep,R), <http://www.licenceusecaseonto.org/Result>(R), <http://www.licenceusecaseonto.org/has-result>(Ev,R), <http://www.licenceusecaseonto.org/Evaluate>(Ev), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ev), <http://www.licenceusecaseonto.org/has-theme>(Ea,Ep), <http://www.licenceusecaseonto.org/Approve>(Ea), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ea), <http://www.licenceusecaseonto.org/has-agent>(Ea,Y), <http://www.licenceusecaseonto.org/Licensor>(Y).

exceptionArt2b(Ep):- condition_3(Ep).

permitted(Ep):- condition_3(Ep).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Article 3. The <http://www.licenceusecaseonto.org/Licensee> must not publish comments on the evaluation of the Product,
%            unless the <http://www.licenceusecaseonto.org/Licensee> is permitted to publish the results of the evaluation.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rule Article 3a %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

prohibited(Ep):- <http://www.licenceusecaseonto.org/Publish>(Ep), <http://www.licenceusecaseonto.org/has-agent>(Ep,X), <http://www.licenceusecaseonto.org/Licensee>(X), <http://www.licenceusecaseonto.org/has-theme>(Ep,C), <http://www.licenceusecaseonto.org/Comment>(C), <http://www.licenceusecaseonto.org/is-comment-of>(C,Ev), <http://www.licenceusecaseonto.org/Evaluate>(Ev), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ev), not exceptionArt3b(Ep).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rule Article 3b %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

condition_4(Ep):- <http://www.licenceusecaseonto.org/Publish>(Ep), <http://www.licenceusecaseonto.org/has-agent>(Ep,X), <http://www.licenceusecaseonto.org/Licensee>(X), <http://www.licenceusecaseonto.org/has-theme>(Ep,C), <http://www.licenceusecaseonto.org/Comment>(C), <http://www.licenceusecaseonto.org/is-comment-of>(C,Ev), <http://www.licenceusecaseonto.org/Evaluate>(Ev), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ev), <http://www.licenceusecaseonto.org/has-result>(Ev,R), <http://www.licenceusecaseonto.org/has-theme>(Epr,R), <http://www.licenceusecaseonto.org/has-agent>(Epr,X), <http://www.licenceusecaseonto.org/Publish>(Epr), permitted(Epr).

exceptionArt3b(Ep):- condition_4(Ep).

permitted(Ep):- condition_4(Ep).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Article 4. If the <http://www.licenceusecaseonto.org/Licensee> is commissioned to perform an independent evaluation of the Product,then the <http://www.licenceusecaseonto.org/Licensee> has the obligation to publish the evaluation results.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rule Article 4a %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

condition_5(Ep):- <http://www.licenceusecaseonto.org/Publish>(Ep), <http://www.licenceusecaseonto.org/has-agent>(Ep,X), <http://www.licenceusecaseonto.org/Licensee>(X), <http://www.licenceusecaseonto.org/has-theme>(Ep,R), <http://www.licenceusecaseonto.org/Result>(R), <http://www.licenceusecaseonto.org/has-result>(Ev,R), <http://www.licenceusecaseonto.org/Evaluate>(Ev), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ev), <http://www.licenceusecaseonto.org/has-theme>(Ec,Ev), <http://www.licenceusecaseonto.org/Commission>(Ec), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Ec).

exceptionArt4a(Ep):- condition_5(Ep).

obligatory(Ep):- condition_5(Ep).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPLIANCE CHECKING RULES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(1) if there is some action x obligatory at time t and, at the same time, x does not really exist => violation; 
%(2) if there is some action x prohibited at time t and, at the same time, x really exists => violation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

<https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(ca(Ep,X,R)) :- <http://www.licenceusecaseonto.org/Remove>(ca(Ep,X,R)), <http://www.licenceusecaseonto.org/has-theme>(ca(Ep,X,R),R), <http://www.licenceusecaseonto.org/has-agent>(ca(Ep,X,R),X), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Er), <http://www.licenceusecaseonto.org/Remove>(Er), <http://www.licenceusecaseonto.org/has-theme>(Er,R),<http://www.licenceusecaseonto.org/has-agent>(Er,X).

compensated(X):- compensate(Y,X), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(Y).

violation(viol(X)) :- obligatory(X), not <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(X), not compensated(X).
violation(viol(X)) :- prohibited(X), <https://www.swansea.ac.uk/law/legal-innovation-lab-wales/riolOntology#Rexist>(X), not compensated(X).

referTo(viol(X),X) :- violation(viol(X)).


%CHECK VIOLATION NUMBER
%violation_number(X) :- #count{Y: violation(viol(Y))}=X.
%#show violation_number/1.


%%%%%%%%%%%%


