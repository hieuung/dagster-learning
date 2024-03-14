FROM python:3.10-slim

# All packages are hard-pinned to `dagster`, so setting the version on just `DAGSTER` will ensure
# compatible versions.
ENV VIRTUAL_ENV=/usr/local
RUN pip install -U uv
RUN uv pip install \
    dagster==1.6.9 \
    dagster-postgres \
    dagster-aws \
    dagster-k8s \
    dagster-celery[flower,redis,kubernetes] \
    dagster-celery-k8s

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Get example pipelines
COPY project/ project/