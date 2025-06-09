FROM python:3.11.3-slim-buster

RUN apt-get update \
    && apt install software-properties-common -y

RUN add-apt-repository ppa:alex-p/tesseract-ocr5

RUN apt-get update \
    && apt install git ghostscript tesseract-ocr pngquant -y \
    && apt-get clean
    
run mkdir /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

COPY server.py /app/server.py

ENTRYPOINT ["streamlit", "run", "server.py", "--server.port=8501", "--server.address=0.0.0.0"]
