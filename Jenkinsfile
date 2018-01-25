node {
     docker.withRegistry('http://index.docker.io/', '6f147927-8588-424b-8e8b-03b320cd664c')
{
    
        git url: "https://github.com/mikonoid/docker_nginx_lamp_app", credentialsId: 'none'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "nginx_lamp_app"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
     
        stage "run docker container"
        docker.image('nginx_lamp_app').withRun {c ->
        sh './test-nginx_lamp_app'
        }
    }
}
