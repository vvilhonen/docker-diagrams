FROM python:alpine3.17 AS builder
ARG DIAGRAMS_VERSION

# RUN apt-get update && apt-get -y install build-essential && rm -rf /var/lib/{apt,dpkg}
RUN apk add --no-cache gcc musl-dev

RUN pip install -t /deps diagrams==$DIAGRAMS_VERSION.


FROM python:alpine3.17

RUN apk add --no-cache graphviz ttf-freefont

COPY --from=builder /deps /deps

ENV PYTHONPATH /deps

WORKDIR /out

ENTRYPOINT ["python"]
