FROM python:3.8 as py_env
RUN pip install pyaml

FROM openjdk:8 as jvm_env
COPY --from=py_env . .
RUN mkdir /strivio
WORKDIR /strivio
COPY . /strivio/
ENV PYTHONUNBUFFERED 1
RUN chmod +x /strivio/run.sh
