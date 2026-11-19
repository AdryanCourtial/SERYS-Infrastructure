***Mise en place de l'application**

**Commande Importante**

**Ansible**

*Verif la config du Server*
```bash
ansible-playbook \
  -i inventory/production.ini \
  playbooks/check-server.yml \
  --ask-pass
```

*Lancer le playbook du server*
```bash
ansible-playbook playbooks/setup-server.yml --syntax-check
```

*Lancer le plyabook de l'install de docker sur le server*
```
ansible-playbook \
  -i inventory/production.ini \
  playbooks/install-docker.yml
```
*Lancer le playbook de la config de l'utilisateur du server*
```
ansible-playbook \
  -i inventory/production.ini \
  playbooks/setup-serys.yml
```