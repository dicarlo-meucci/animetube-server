FROM node
RUN git clone https://github.com/dicarlo-meucci/animetube-server
WORKDIR /animetube-server
RUN mv .env.example .env
RUN sed -i 's/DB_HOST=localhost/DB_HOST=172.17.0.2/' .env
RUN sed -i 's/DB_PASSWORD=/DB_PASSWORD=pw/' .env
RUN sed -i 's/DB_PORT=3306/DB_PORT=3306/' .env
RUN npm install
EXPOSE 3000
ENTRYPOINT node .