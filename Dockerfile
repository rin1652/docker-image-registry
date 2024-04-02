FROM python:3.9-slim

# Prevents writing the pyc files
# Removes output stream buffering, allowing for more efficient logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN mkdir /opt/web_app

ENV PROJECT_DIR /opt/web_app

WORKDIR ${PROJECT_DIR}

COPY Pipfile Pipfile.lock ${PROJECT_DIR}/

RUN apt-get update && python -m pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pipenv && \
    pipenv sync && \
    apt-get autoclean && \
    apt-get autoremove

# Not running any migration command
# Since we do not have anything at this point
COPY . ${PROJECT_DIR}

EXPOSE 8080

# Run the application
# you can run with gunicorn; perhaps will show in later videos
CMD ["pipenv", "run", "python", "manage.py", "runserver", "0.0.0.0:8080"]