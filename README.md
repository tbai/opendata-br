opendata-br
===========

Visualização de dados abertos brasileiros.

Dados abertos:
- http://dados.gov.br/dataset/despesas-diretas-do-poder-executivo-federal-publicados-no-portal-da-transparencia
- http://dados.gov.br/dataset/ocorrencias-criminais-no-estado-do-rio-grande-do-sul

Banco de dados:

- CREATE DATABASE opendatabr CHARACTER SET utf8 COLLATE utf8_general_ci;
- CREATE USER 'opendatabr'@'localhost' IDENTIFIED BY 'opendatabr';
- GRANT ALL PRIVILEGES ON \*.\* TO 'opendatabr'@'localhost' WITH GRANT OPTION;
                            