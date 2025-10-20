# OCRmyPDFonWEB

Streamlit Web UI for OCRmyPDF. Its codebase is tiny, so if you want to modify it, it should be straightforward. It is also stateless, making it easy to deploy. No volumes. No configuration.

![screenshot](screenshot.png "Screenshot")

## Requirements

* docker

## Usage

```
git clone https://github.com/irrwitzer42/OCRmyPDFonWEB.git
docker build -t irrwitzer42/ocmypdfonweb OCRmyPDFonWEB

docker run --rm -p 192.168.4.39:8501:8501 irrwitzer42/ocmypdfonweb
# or:
docker run -d --rm -p 192.168.4.39:8501:8501 irrwitzer42/ocmypdfonweb
```

* Open http://localhost:8501

## Alternatively use docker-compose:

```
docker compose build
docker compose up -d
```

* Open http://localhost:8501

## Develop

```
docker build -t irrwitzer42/ocrmypdfonweb:dev .            # Only needed after you changed requirements.txt
docker run --rm -it -p 127.0.0.1:8501:8501 -v ${PWD}/server.py:/app/server.py irrwitzer42/ocrmypdfonweb:dev
```

Happy coding :)

## FAQ

### Why?

To keep your non-tech significant other happy. The terminal can be a dark place for some people.

### What version of OCRmyPDF version are you using?
Latest version with latest version of tesseract based on the OCRmyPDF alpine docker image

## History

* This is a modified fork of [heapsoftware's version](https://github.com/heapsoftware/OCRmyPDFonWEB)
  * use alpine instead of ubuntu base image
  * added language selection
  * disabled disfunct backgroud-removal functin for now
* Which has been in turn a modernized version of [razem-io's original work](https://github.com/razem-io/OCRmyPDFonWEB) 
  * use official ocrmypdf docker image (ubuntu version) instead of building on basis of python3 image
  * modernized and updated docker build script to work with current systems
  * updated documentation

** Thanks to both of you for your work and for providing it for the public! **

