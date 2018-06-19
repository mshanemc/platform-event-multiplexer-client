sfdx force:org:create -s -f config/project-scratch-def.json -d 1
sfdx force:source:push

# sfdx force:data:record:create -s Test__e -v "Test_Value__c=1"
# sfdx force:data:record:create -s Test__e -v "Test_Value__c=2"
# sfdx force:data:record:create -s Test__e -v "Test_Value__c=3"

sfdx force:apex:execute -f localTesting/regCallout.cls
