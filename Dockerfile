FROM mcr.microsoft.com/dotnet/core/sdk:2.2.203-bionic

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		git \
		libuv1-dev \
		python3 \
		curl \
		vim && \
	rm -rf /var/lib/apt/lists/* && \
	curl \
		-fLo ~/.vim/autoload/plug.vim \
		--create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
	curl \
		-fLo ~/.omnisharp/omnisharp-roslyn/release.tar.gz \
		--create-dirs \
		https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.32.18/omnisharp.http-linux-x64.tar.gz && \
	tar -xzf ~/.omnisharp/omnisharp-roslyn/release.tar.gz \
		-C ~/.omnisharp/omnisharp-roslyn/ && \
	rm ~/.omnisharp/omnisharp-roslyn/release.tar.gz

COPY ./home /root

RUN vim -E -s -u "/root/.vimrc" +PlugInstall +qall

WORKDIR /project
