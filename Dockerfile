FROM effectiverange/er-devc-armhf-bookworm:latest

COPY deps.json /tmp/devc/deps.json
RUN chroot /var/chroot/buildroot apt update  && chroot /var/chroot/buildroot apt install -y --no-install-recommends $(dpkgdeps --arch armhf --debdeps /tmp/devc/  | tr ',' ' ') && dpkgdeps --arch amd64 -v /tmp/devc


