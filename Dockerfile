FROM jbarlow83/ocrmypdf-alpine

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python \
        && python3 -m ensurepip \
        && pip3 install --no-cache --upgrade pip setuptools

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --break-system-packages -r requirements.txt && rm requirements.txt

COPY server.py /app/server.py

ENTRYPOINT ["streamlit", "run", "server.py", "--server.port=8501", "--server.address=0.0.0.0"]
