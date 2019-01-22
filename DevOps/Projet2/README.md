# 26-academy
Sources du projet tutoré n°2 concernant la formation Expert DevOps- Parcours certifiant 175 heures avec tutorat

concurrent = 1
check_interval = 0

[session_server]
  session_timeout = 1800

[[runners]]
  name = "My Docker Runner"
  url = "https://gitlab.com/"
  token = "YDuWKursLGrxyb_yXm6i"
  executor = "docker"
  [runners.docker]
    tls_verify = false
    image = "docker:stable"
    privileged = true
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/cache"]
    shm_size = 0
  [runners.cache]
    [runners.cache.s3]
    [runners.cache.gcs]
