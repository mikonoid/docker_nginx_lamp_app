node {
     docker.withRegistry('http://index.docker.io/', 'e21031d2-5283-4f12-9fda-1e7eb7a94d54')
{
    
        git url: "https://github.com/mikonoid/docker_nginx_lamp_app", credentialsId: 'none'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        docker.build('nginx_lamp_app').inside("--volume=/var/run/docker.sock:/var/run/docker.sock") {  
        stage "build"
        def app = docker.build "nginx_lamp_app"
          }
    
        
        stage "run docker container"
        docker.image('nginx_lamp_app').withRun {c ->
        sh 'docker run -d -p 80:80 -p 3306:3306 nginx_lamp_app'
       }
     

    }
}
