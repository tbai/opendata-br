opendata-br
===========

Visualização de dados abertos brasileiros.

Dados abertos:
- http://dados.gov.br/dataset/despesas-diretas-do-poder-executivo-federal-publicados-no-portal-da-transparencia
- http://dados.gov.br/dataset/ocorrencias-criminais-no-estado-do-rio-grande-do-sul

Banco de dados:

- CREATE DATABASE opendata_br CHARACTER SET utf8 COLLATE utf8_general_ci;
- CREATE USER 'opendatauser'@'localhost' IDENTIFIED BY 'opendatauser';
- GRANT ALL PRIVILEGES ON *.* TO 'opendatauser'@'localhost' WITH GRANT OPTION;
                            