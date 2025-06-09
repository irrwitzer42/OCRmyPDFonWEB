FROM jbarlow83/ocrmypdf-ubuntu

RUN apt-get update \
    && apt install pip -y \
    && apt-get clean

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

COPY server.py /app/server.py

ENTRYPOINT ["streamlit", "run", "server.py", "--server.port=8501", "--server.address=0.0.0.0"]
