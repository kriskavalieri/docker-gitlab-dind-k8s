FROM docker:stable-dind

ARG KUBECTL_VERSION=1.8.10
ARG HELM_VERSION=2.8.2

COPY .ssh /root/.ssh
RUN apk update && apk add curl openssl bash git openssh-client grep && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* && \
    mkdir -p /root/.ssh && chmod 700 /root/.ssh && chmod 644 /root/.ssh/* && \
    curl -s -o /usr/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    curl -s -o /tmp/helm.tgz -LO https://storage.googleapis.com/kubernetes-helm/helm-v$HELM_VERSION-linux-amd64.tar.gz && \
    tar -xzf /tmp/helm.tgz linux-amd64/helm --strip-components=1 -C /usr/bin/ && \
    chmod +x /usr/bin/kubectl /usr/bin/helm
