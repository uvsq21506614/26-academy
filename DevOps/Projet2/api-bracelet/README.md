# API simulant les bracelés de santé connecté
Projet tutoré n°2 concernant le parcours DevOps
##
git pull
## Installer les dépendances du projet python
pip install -r requirements.txt

## Démarer l'API 
python \_\_main\_\_.py -H 0.0.0.0
## GitLab Config

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
