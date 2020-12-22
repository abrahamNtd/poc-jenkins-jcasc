job('seed_job') {
  scm {
    git {
      remote {
        url('https://github.com/abrahamNtd/jcasc-poc.git')
      }
      branch('main')
    }
  }
  steps {
    dsl {
      external('hellow_world_job.groovy')
    }
  }
}
