alias microkube='python tools/microkube.py'
alias microkube-registry='./tools/docker-registry.py'
alias microkube-proxy="vagrant ssh master -c \"sudo su -c 'kubectl proxy --address=\"0.0.0.0\" --port=8001 &' vagrant\""
