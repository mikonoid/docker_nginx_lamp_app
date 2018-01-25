node {
     docker.withRegistry('http://index.docker.io/mk51', '96995c79-1149-4c7a-88ed-ee38ddea4406')
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
