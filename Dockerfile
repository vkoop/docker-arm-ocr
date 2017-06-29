FROM armhf/ubuntu:trusty

RUN apt-get update \
    && apt-get install -y git tesseract-ocr tesseract-ocr-deu inotify-tools pdftk  poppler-utils \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./ocr /ocr

RUN ln -s /ocr/tesseractocr.sh /usr/local/bin/tesseractocr  \
    && ln -s /ocr/create_listener.sh /usr/local/bin/ocr_start_listen 

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN ln -s usr/local/bin/entrypoint.sh / # backwards compat

ENTRYPOINT ["entrypoint.sh"]

CMD ["ocr"]