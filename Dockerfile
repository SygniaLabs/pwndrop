FROM golang:1.18.4 as base
WORKDIR /go
RUN git clone https://github.com/AGHRapidPro/pwndrop

FROM base as build
WORKDIR /go/pwndrop
RUN make build

FROM build as run
ENV PATH="/go/pwndrop/build:${PATH}"
CMD ["pwndrop"]
