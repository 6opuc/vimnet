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
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY ./home /root

RUN vim -E -s -u "/root/.vimrc" +PlugInstall +qall

WORKDIR /project
