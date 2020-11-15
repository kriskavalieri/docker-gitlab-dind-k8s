FROM docker:18.03.1-ce-dind

ARG KUBECTL_VERSION=1.19.2
ARG HELM_VERSION=3.4.0

COPY .ssh /root/.ssh
RUN apk update && apk add python3 nodejs curl openssl bash git openssh-client grep && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* && \
    mkdir -p /root/.ssh && chmod 700 /root/.ssh && chmod 644 /root/.ssh/* && \
    curl -s -o /usr/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash && \
    curl -OL https://github.com/digitalocean/doctl/releases/download/v1.51.0/doctl-1.51.0-linux-amd64.tar.gz && \
    tar xf *.tar.gz && \
    mv doctl /usr/local/bin && \
    chmod +x /usr/bin/kubectl
