#!/usr/bin/env groovy

import groovy.json.JsonSlurper
import java.text.*
result = []


def env = ["PATH=\$PATH:/usr/bin:/usr/local/bin", 
           "http_proxy=http://forwardproxy:3128", 
           "https_proxy=http://forwardproxy:3128", 
           "no_proxy=127.0.0.1,localhost,169.254.169.254",
           "AWS_ACCESS_KEY_ID=ASIAJHKNWJEXR6YJCAFA",
           "AWS_SECRET_ACCESS_KEY=4Ktaz5JyAtf3rE3U9sbn4rXArrmb/zUakAdrQBeR",
           "AWS_SECURITY_TOKEN=FQoDYXdzED8aDEae3xVSwfC1riSXwiLtASiEfZQUCIQn2VBjtTKvc2kHpUxStFa8vlEoGTcXL3q1f69g5hvYmR43o6IDNH96CETum9R1iMfV60Z908kM9/BDkeecnAMxxpKOTdXxtlgfjr4d0f84PKCM7AvSYwYtHSZcORfknFKO7qNRSPgM2M0I/+BzeumlTkiNFAcqVP71RlasEHUHWCup3Ayf5TQwG7STod7yw/B0fNSI7xDdmF606twrbmTlwr7pFLRp2r6gsPUYv2EXMDZ1uQLI3iwk5wKmPLWANgEk5BDl9aU+Lxuw7yV8JqNR9mkMIUoBxU/E/Lcw+xASs+K8HZgR2Cjn8d7QBQ=="
          ]

//command="KST=\$(aws sts assume-role --role-arn arn:aws:iam::648515672437:role/ESGProvisioningRole --role-session-name Provision --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' --output text) && "
//command=command + "unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SECURITY_TOKEN && "
//command=command + "export AWS_ACCESS_KEY_ID=\$(echo \$KST|awk '{print \$1}') && export AWS_SECRET_ACCESS_KEY=\$(echo \$KST|awk '{print \$2}') && export AWS_SECURITY_TOKEN=\$(echo \$KST|awk '{print \$3}') && "
//command=command + "aws s3 ls s3://nabapi.nonprod/ami-promote-schnonprod/ --region ap-southeast-2  --output text"
command= "aws s3 ls s3://nabapi.nonprod/ami-promote-schnonprod/ --region ap-southeast-2  --output text"

def cmd = ["/bin/sh", "-c", command]


println "Executing query: "
println command
println ""

def sout = new StringBuilder(), serr = new StringBuilder()
def proc = cmd.execute(env, new File("/tmp"))
def procout = proc.text
proc.consumeProcessOutput(sout, serr)
proc.waitForOrKill(2000)

println "sout: " + sout
println "serr: " + serr
println "text: " + procout

if ( serr.length() > 0 )
{
    println "Error encountered when running command:"
    println serr
    return "command error"
}

def lineArry
tempvar=""
data = procout.split("\n")
String element

for(aLine in data){

  element = aLine.split(" ").last()
  
  if(element != '0' ) {
    result = result + element
 }
  
}
  
return result
