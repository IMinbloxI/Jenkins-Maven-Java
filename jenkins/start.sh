cat > ~/jenkins/start.sh << 'EOF'
#!/bin/bash
cd ~/jenkins
java -Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true -jar jenkins.war --httpPort=9090
EOF
chmod +x ~/jenkins/start.sh