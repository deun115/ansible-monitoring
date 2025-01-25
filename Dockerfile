# 베이스 이미지는 최신 Ubuntu 버전을 사용
FROM ubuntu:latest

# 환경 설정
ENV DEBIAN_FRONTEND=noninteractive

# 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ssh \
    sudo \
    systemd \
    && apt-get clean

# Ansible 설치
RUN sudo apt install ansible -y

# 로그인 정보 입력
RUN echo "root:password" | chpasswd

# SSH 포트 노출
EXPOSE 22
