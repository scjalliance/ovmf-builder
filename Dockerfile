FROM scjalliance/edk2:udk2018

ARG TARGET=RELEASE
ARG TARGET_ARCH=X64
ARG PLATFORM=OvmfPkg/OvmfPkgX64.dsc

WORKDIR /opt/src/edk2/Conf

RUN echo "TARGET                       = ${TARGET}" >> target.txt && \
    echo "TARGET_ARCH                  = ${TARGET_ARCH}" >> target.txt && \
    echo "ACTIVE_PLATFORM              = ${PLATFORM}" >> target.txt

WORKDIR /opt/src/edk2

RUN ["/bin/bash", "-c", "source edksetup.sh && build"]

VOLUME /ovmf

CMD ["/bin/bash", "-c", "cp /opt/src/edk2/Build/OvmfX64/RELEASE_GCC5/FV/OVMF*.fd /ovmf"]
