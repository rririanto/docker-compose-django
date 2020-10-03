# pull official python alpine image
FROM python:3.7

# Set Environment Variable
ENV PYTHONUNBUFFERED 1
ENV C_FORCE_ROOT true

RUN mkdir -p /opt/django/dev

# Creating Work Directory
WORKDIR /opt/django/dev

# Adding mandatory packages to docker
RUN apt-get -q update && apt-get install -y --no-install-recommends \
    default-mysql-client \
    default-libmysqlclient-dev && rm -rf /var/lib/apt/lists/*

# Update pip
RUN pip install --upgrade pip

# Installing requirements.pip from project
ADD dev/requirements/production.txt /opt/django/dev/
RUN pip install --no-cache-dir -r production.txt
ADD dev/ /opt/django/dev/

# CMD will run when this dockerfile is running
CMD ["sh", "-c", "gunicorn -b :80 --workers=3 config.wsgi:application"]
