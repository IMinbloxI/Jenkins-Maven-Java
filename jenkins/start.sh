cat -n ./jenkins/start.sh

#!/bin/bash
cd ./jenkins
java -Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true \
     -Djenkins.install.runSetupWizard=false \
     -jar jenkins.war --httpPort=9090

