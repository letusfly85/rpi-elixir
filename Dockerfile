FROM hypriot/rpi-python

RUN apt-get update
RUN apt-get install -y wget

RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb && \
    sed -i -e "s/squeeze/wheezy/g" /etc/apt/sources.list.d/erlang-solutions.list && \
    apt-get update && \
    apt-get install -y erlang

RUN apt-get install -y git cmake build-essential

RUN git clone https://github.com/elixir-lang/elixir.git && \
    cd elixir && \
    git checkout v1.3 && \
    make clean && make && make install
