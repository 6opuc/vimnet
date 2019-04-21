FROM mcr.microsoft.com/dotnet/core/sdk:2.2.203-alpine3.9

RUN apk add --update \
	git \
	vim && \
	rm -rf /var/cache/apk/*

WORKDIR /project
