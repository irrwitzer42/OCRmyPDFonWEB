FROM python:3.11.3-slim-buster

RUN apt-get install apt-transport-https -y

RUN echo "deb https://notesalexp.org/tesseract-ocr5/$(lsb_release -cs)/ $(lsb_release -cs) main" \
| tee /etc/apt/sources.list.d/notesalexp.list > /dev/null

RUN apt-get update -oAcquire::AllowInsecureRepositories=true \
    && apt-get install notesalexp-keyring -oAcquire::AllowInsecureRepositories=true

RUN apt-get update \
    && apt install git ghostscript tesseract-ocr imagemagick pngquant -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

COPY server.py /app/server.py

ENTRYPOINT ["streamlit", "run", "server.py", "--server.port=8501", "--server.address=0.0.0.0"]
