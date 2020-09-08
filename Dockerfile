FROM continuumio/miniconda3

RUN apt update -y && \
	apt install gcc -y

WORKDIR /opt/ml/code

RUN pip install sagemaker-training

COPY src/ /opt/ml

ENV SAGEMAKER_PROGRAM train

ENV PATH="/opt/ml/code:${PATH}"

