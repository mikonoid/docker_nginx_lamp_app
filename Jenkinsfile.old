node {
     docker.withRegistry('http://docker-registry.test.sxb:80/v2', '461e3d4c-b4ed-4c5e-a0c1-dbefeb8fcd5c')
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
