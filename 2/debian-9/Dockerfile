FROM bitnami/minideb-extras:stretch-r308
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages fontconfig fonts-dejavu-extra libc6 libcomerr2 libcurl3 libffi6 libgcc1 libgcrypt20 libgmp10 libgnutls30 libgpg-error0 libgssapi-krb5-2 libhogweed4 libidn11 libidn2-0 libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libldap-2.4-2 libnettle6 libnghttp2-14 libp11-kit0 libpsl5 librtmp1 libsasl2-2 libssh2-1 libssl1.0.2 libssl1.1 libtasn1-6 libunistring0 openssh-client unzip zlib1g
RUN bitnami-pkg install java-1.8.201-0 --checksum de49557872836fdbd965389ebcc72e163f7242cf691d435993cc2e4f3cd56ae7
RUN bitnami-pkg install git-2.21.0-0 --checksum 37eb00d863f94194c0c31464c2c747bc784e662adbab240b5f0ef46b3e259e52
RUN bitnami-pkg unpack jenkins-2.150.3-0 --checksum 12f24ca99a80e00781ee2500bc309da1c61e531a16af1947fc37d19cd023101c
RUN mkdir -p /usr/share/jenkins/ref

COPY rootfs /
RUN ln -sf /install-plugins.sh /usr/local/bin/install-plugins.sh
ENV BITNAMI_APP_NAME="jenkins" \
    BITNAMI_IMAGE_VERSION="2.150.3-debian-9-r20" \
    DISABLE_JENKINS_INITIALIZATION="no" \
    JAVA_OPTS="" \
    JENKINS_HOME="/opt/bitnami/jenkins/jenkins_home" \
    JENKINS_PASSWORD="bitnami" \
    JENKINS_USERNAME="user" \
    PATH="/opt/bitnami/java/bin:/opt/bitnami/git/bin:$PATH"

EXPOSE 8080 8443 50000

ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "/run.sh" ]
