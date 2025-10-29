ARG BASE_DEVC_IMAGE_REPO=effectiverange/er-devc-armhf-bookworm
ARG BASE_DEVC_IMAGE_VER=latest

FROM ${BASE_DEVC_IMAGE_REPO}:${BASE_DEVC_IMAGE_VER}

COPY deps.json /tmp/devc/deps.json
RUN if [ -d /var/chroot/buildroot ]; then chroot /var/chroot/buildroot apt update  && \
    chroot /var/chroot/buildroot apt-get remove -y libunwind-* && \
    chroot /var/chroot/buildroot apt install -y --no-install-recommends $(dpkgdeps --arch armhf --debdeps /tmp/devc/  | tr ',' ' ') ; fi && \
    dpkgdeps --arch amd64 -v /tmp/devc && \
    rm -f /tmp/dpkgdeps.lock 


