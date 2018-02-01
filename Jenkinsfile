node {
     

    
        git url: "https://github.com/mikonoid/docker_nginx_lamp_app", credentialsId: 'none'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "nginx_lamp_app"
          
        stage "run docker container"
        docker.image('nginx_lamp_app').withRun {c ->
        sh 'docker run -d -p 80:80 -p 3306:3306 nginx_lamp_app'
       }
     

    
}
