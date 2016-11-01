SHELL=/bin/bash

# the default provider
PROVIDER=virtualbox

up: dependencies
	time vagrant up --provider $(PROVIDER)

provision:
	time vagrant provision

destroy:
	time vagrant destroy -f

dependencies:
	rm -rf roles/*
	time ansible-galaxy install -f -r requirements.yml -p roles

status:
	vagrant status

ssh-test:
	time vagrant ssh -c hostname

# Declare commands to be not associated with files
.PHONY: up provision destroy dependencies ssh-test
