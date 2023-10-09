FROM ubuntu:22.04
ARG DOWNLOAD_URL='https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.3/nopCommerce_4.60.3_NoSource_linux_x64.zip'
ARG TARGET_FOLDER="/nop"
ADD  ${DOWNLOAD_URL} ${TARGET_FOLDER}/nopCommerce_4.60.3_NoSource_linux_x64.zip
RUN apt update && apt install unzip &&\
    cd ${TARGET_FOLDER} &&\
    unzip nopCommerce_4.60.3_NoSource_linux_x64.zip && \
    rm nopCommerce_4.60.3_NoSource_linux_x64.zip && \
    mkdir bin logs
FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author=khajaibrahim
ARG TARGET_FOLDER="/nop"
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
COPY --from=extractor ${TARGET_FOLDER}  ${TARGET_FOLDER}
EXPOSE 5000
WORKDIR ${TARGET_FOLDER}
CMD ["dotnet", "Nop.Web.dll"]

