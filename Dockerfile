FROM gcr.io/stacksmith-images/minideb:jessie-r9

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=jenkins \
    BITNAMI_IMAGE_VERSION=2.46-r0 \
    PATH=/opt/bitnami/tomcat/bin:/opt/bitnami/git/bin:/opt/bitnami/java/bin:$PATH

# Additional modules required
RUN bitnami-pkg install java-1.8.0_121-0 --checksum 2743f753fd1ea88bf90352d95694f89ab0a0fb855cf0d1c7b2a6d92835f9ad27
RUN bitnami-pkg install tomcat-8.0.41-0 --checksum 47b6afb2f4f32ea573264f7b9947d855a2df837e4dae99d22db811de7ee57194
RUN bitnami-pkg install git-2.10.1-1 --checksum 454e9eb6fb781c8d492f9937439dcdfc1a931959d948d4c70e79716d2ea51a2b

# Install jenkins
RUN bitnami-pkg unpack jenkins-2.46-0 --checksum 070650502ad0f0efa0628337f6d44e13663d8c5926583e0c45986426aad0842a

COPY rootfs /

ENV JENKINS_USERNAME="user" \
    JENKINS_PASSWORD="bitnami"

VOLUME ["/bitnami/jenkins"]

EXPOSE 8080 8443 50000

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["nami", "start", "--foreground", "tomcat"]
