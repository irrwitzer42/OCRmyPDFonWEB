FROM python:3.11.3-slim-buster

RUN apt-get update \
    && apt install git ghostscript wget unzip pngquant -y \
    && apt-get clean

RUN export PATH=/user/local/bin:$PATH 

RUN apt-get update && \ 
    apt-get install libleptonica-dev automake make pkg-config libsdl-pango-dev libtool g++ libicu-dev libcairo2-dev bc ffmpeg libsm6 libxext6 -y 

RUN wget github.com/tesseract-ocr/tesseract/archive/5.5.1.zip
RUN unzip 5.5.1.zip
RUN cd tesseract-5.5.1 && \
     ./autogen.sh && \
     ./configure && \
     make && \
     make install && \
     ldconfig && \
     make training && \
     make training-install
RUN tesseract --version

run mkdir /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

COPY server.py /app/server.py

ENTRYPOINT ["streamlit", "run", "server.py", "--server.port=8501", "--server.address=0.0.0.0"]
