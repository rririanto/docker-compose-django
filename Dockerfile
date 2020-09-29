# pull official python alpine image
FROM python:3.7

# Set Environment Variable
ENV PYTHONUNBUFFERED 1
ENV C_FORCE_ROOT true

RUN mkdir -p /opt/django/example

# Creating Work Directory
WORKDIR /opt/django/example

# Adding mandatory packages to docker
RUN apt-get -q update && apt-get install -y --no-install-recommends \
    default-mysql-client \
    default-libmysqlclient-dev && rm -rf /var/lib/apt/lists/*

# Update pip
RUN pip install --upgrade pip

# Installing requirements.pip from project
ADD example/requirements.txt /opt/django/example/
RUN pip install --no-cache-dir -r requirements.txt
ADD example/ /opt/django/example/

# CMD will run when this dockerfile is running
CMD ["sh", "-c", "python manage.py collectstatic --no-input; python manage.py migrate; gunicorn example.wsgi -b 0.0.0.0:80"]
