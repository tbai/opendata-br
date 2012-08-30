package com.opendatabr.data

import org.grails.plugins.csv.CSVMapReader
import grails.converters.JSON

class DespesasExecutivoFederalController {

    def index() {
        render "DespesasExecutivoFederalController"
    }

    def uploadDataFile() {
        def f = request.getFile('myFile')
        if (f.empty) {
            flash.error = 'Arquivo não pode ser vazio.'
            render(view: 'importForm')
            return
        } 
        
        try{
            def settings = ['separatorChar':';', 'charset':'ISO-8859-1', skipLines:1]
            def reader = f.getInputStream().toCsvReader(settings)

            def header = [
                'codigo_orgao_superior','nome_orgao_superior','codigo_orgao_subordinado','nome_orgao_subordinado',
                'codigo_unidade_gestora','nome_unidade_gestora','codigo_grupo_despesa','nome_grupo_despesa',
                'codigo_funcao','nome_funcao','codigo_subfuncao','nome_subfuncao','codigo_programa','nome_programa',
                'codigo_acao','nome_acao','linguagem_cidada','valor']

            def map
            def ano = params.ano.year +1900
            reader.eachLine{ tokens ->
                map = [ano:ano]
                tokens.eachWithIndex { t, i->
                    if(header[i] == "valor"){
                        map["valor"] = t.replaceAll(",", ".").toBigDecimal() 
                    } else {
                        map[header[i]] = t
                    }
                }
                try{
                    DespesasExecutivoFederal.findOrSaveWhere(map)
                } catch(Exception domainEx){
                    DespesasExecutivoFederal.withSession { session ->
                        session.clear()
                    }        
                    log.error "Erro ao importar dado.", domainEx
                }
            }
           
            flash.message = "Arquivo de dados importado com sucesso."
            
        } catch(Exception ex){
            
            flash.error = ex.message   
            log.error "Erro ao importar arquivo de dados.", ex
        }

        render(view: 'importForm')
    }

    def importForm(){

    }

    def barChart(){
        def result = DespesasExecutivoFederal.withCriteria{
            projections{
                groupProperty "ano"
                groupProperty "nome_orgao_superior"
                sum "valor"
            }
            
        }

        def json = [label:[], values:[]]

        def anos  = result.toList().groupBy{ it[0] }.collect{key, value -> key}
        

        def nomes = result.toList().groupBy{ it[1] }.collect{key, value -> key}

        

        json.label = nomes

        def map = [:]
        anos.each{ ano->
            // ano
            def val = [
                label: ano, 
                values: [] ]

            result.findAll{
                it[0] == ano
            }.each { line->
                val.values << ((line[2] / 1000000) as int)
            }
            
            json.values << val
        }

        
        [jsonData:json.encodeAsJSON()]

    }
}
