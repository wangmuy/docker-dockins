node {
    stage('prepare') {
        sh """
        id
        sockgroup=\$(stat -c '%g' /var/run/docker.sock)
        cat /etc/group | grep -e ":\$sockgroup:" || sudo addgroup -g \$sockgroup -S mydocker
        sudo usermod -aG \$sockgroup jenkins
        cat /etc/group | grep -e "^docker:" && sudo usermod -aG docker jenkins
        """
    }
    stage('docker') {
        docker.image('python:3.5.1').inside('-v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro') {
            sh """
            python --version
            """
        }
    }
}

