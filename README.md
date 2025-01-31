# Ansible Monitoring System
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=Prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)

## How to Install Ansible
macOS: `brew install ansible`

pip: `pip install ansible`

Ubuntu: `sudo apt install ansible`

## How to Start
1) `docker-compose up -d`
- Ansible은 systemd 기반으로 실행되기 때문에 Ubuntu 환경에서의 설치가 필요하다. 그래서 Ubuntu 기반의 도커 컨테이너를 활용한다.
- systemd는 컨테이너 내에서 프로세스와 리소스를 관리하려면 쓰기 가능한 cgroup 파일 시스템에 접근할 수 있어야 하기 때문에 Dockerfile에서 로그인 정보를 입력해야 한다.

2) `docker attach`
- 도커 내부로 진입하여 내부에서 Ansible을 직접 실행하고자 하였다. 만약 호스트 서버에서 도커 내부의 Ansible을 실행시키고자 할 때에는 inventory.ini 파일에 해당 변수를 추가해야 한다.
```
[container_name]
localhost ansible_host=127.0.0.1 ansible_port=22 ansible_user=root ansible_password=password ansible_connection=ssh
```

3) `ansible-galaxy install -r requirements.yml`
- [ansible-galaxy](https://galaxy.ansible.com/ui/)에서 다운받은 rule을 사용하기 위해 필요한 collections들을 저장해둔 requirements.yml 파일을 활용하여 한꺼번에 설치한다.

4) `ansible-playbook -i inventory.ini playbook.yml`
- ansible 실행
- 만약 sudo 명령어로 실행시킬 때 비밀번호를 입력받아야 한다면 `--ask-become-pass` 옵션 추가하기

5) `ansible-playbook playbook.yaml --syntax-check`
- ansible 실행 전 문법 체크
