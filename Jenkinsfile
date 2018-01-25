node {
     docker.withRegistry('http://index.docker.io/', 'aaaf2402-1ac7-4b70-8b0c-7b15357c621a')
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
     

    }
}
