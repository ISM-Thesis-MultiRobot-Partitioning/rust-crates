FROM rust:1.70

ARG BACKEND=local-robot-map
ARG API=partition-api

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                              Cache the libraries
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# create dummy crates
RUN cargo init --lib /app/${BACKEND} \
    && cargo init --bin /app/${API}

COPY ${BACKEND}/Cargo.toml /app/${BACKEND}
COPY ${API}/Cargo.toml /app/${API}

# build dummy project to cache the dependencies
RUN cd /app/${API} && cargo build

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                               Build the project
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

COPY ${BACKEND}/*.toml /app/${BACKEND}
COPY ${BACKEND}/src /app/${BACKEND}/src

COPY ${API}/*.toml /app/${API}
COPY ${API}/src /app/${API}/src

RUN cargo install --offline --path app/${API}

CMD [ "partition-api" ]
