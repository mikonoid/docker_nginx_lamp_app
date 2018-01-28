node {
     

    
        git url: "https://github.com/mikonoid/docker_nginx_lamp_app", credentialsId: 'none'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        docker.build('nginx_lamp_app').inside("--volume=/var/run/docker.sock:/var/run/docker.sock") {  
        
          }
          
        stage "run docker container"
        docker.image('nginx_lamp_app').withRun {c ->
        sh 'docker run -d -p 80:80 -p 3306:3306 nginx_lamp_app'
       }
     

    
}
