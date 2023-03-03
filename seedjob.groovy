pipelineJob('Basic_Pipeline') {
  def repo = 'https://github.com/abrahamNtd/poc-java-spring-boot-rest.git' 
  description("Jenkins Pipeline for building and testing a rest  service") 
  keepDependencies(false) 
  properties{
    githubProjectUrl (repo) 
  } 
  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) } 
          branches('feature/docker') 
          scriptPath('ci/Jenkinsfile') 
          extensions { }
        } 
      } 
    } 
  }
}