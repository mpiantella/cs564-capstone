FROM python:3.8-alpine

RUN pip3 install httpserver 

RUN apk add openssl

WORKDIR /C2

RUN apk update && apk add bash

ADD C2_code.sh.x C2_code.sh clean_image.png get_data.sh index.html set_code.sh mainImage.png set_up_server.sh found_secret_data.txt ./

COPY set_up_server.sh /docker-entrypoint.d/

RUN chmod +x /docker-entrypoint.d/set_up_server.sh

RUN chmod +x set_up_server.sh

RUN chmod +x get_data.sh

RUN chmod +x set_code.sh

CMD python3 -m http.server 8000

EXPOSE 8000 