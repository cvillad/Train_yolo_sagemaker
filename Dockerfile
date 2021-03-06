FROM nvcr.io/nvidia/pytorch:20.08-py3

# Force stdin, stdout and stderr to be totally unbuffered. Good for logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends nginx curl

WORKDIR /opt/ml/

RUN pip install sagemaker-training

COPY src/ /opt/ml/code

RUN mkdir /opt/ml/checkpoints

ENV SAGEMAKER_PROGRAM train

ENV PATH="/opt/ml/code:${PATH}"

