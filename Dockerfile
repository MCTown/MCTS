FROM ubuntu:20.04 AS builder

WORKDIR /

RUN apt update && apt install -y wget tar
RUN wget -c https://github.com/alibaba/dragonwell17/releases/download/dragonwell-17.0.2.0.2%2B8_jdk-17.0.2-ga/Alibaba_Dragonwell_17.0.2.0.2%2B8_x64_linux.tar.gz -O - | tar -xz

FROM python:3-slim

COPY --from=builder /dragonwell-17.0.2.0.2+8-GA /dragonwell
ENV JAVA_HOME=/dragonwell

RUN pip install --upgrade pip && pip install mcdreforged && pip cache purge

VOLUME /workspace
WORKDIR /workspace
CMD ["python", "-m", "mcdreforged"]
