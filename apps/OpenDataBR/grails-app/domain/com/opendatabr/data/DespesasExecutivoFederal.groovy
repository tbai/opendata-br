package com.opendatabr.data

class DespesasExecutivoFederal {

    Integer ano
    String codigo_orgao_superior
    String nome_orgao_superior
    String codigo_orgao_subordinado
    String nome_orgao_subordinado
    String codigo_unidade_gestora
    String nome_unidade_gestora
    String codigo_grupo_despesa
    String nome_grupo_despesa
    String codigo_funcao
    String nome_funcao
    String codigo_subfuncao
    String nome_subfuncao
    String codigo_programa
    String nome_programa
    String codigo_acao
    String nome_acao
    String linguagem_cidada
    BigDecimal valor

    static constraints = {
        ano nullable:false
        codigo_orgao_superior nullable:true
        nome_orgao_superior nullable:true
        codigo_orgao_subordinado nullable:true
        nome_orgao_subordinado nullable:true
        codigo_unidade_gestora nullable:true
        nome_unidade_gestora nullable:true
        codigo_grupo_despesa nullable:true
        nome_grupo_despesa nullable:true
        codigo_funcao nullable:true
        nome_funcao nullable:true
        codigo_subfuncao nullable:true
        nome_subfuncao nullable:true
        codigo_programa nullable:true
        nome_programa nullable:true
        codigo_acao nullable:true
        nome_acao nullable:true
        linguagem_cidada nullable:true
        valor nullable:false
    }
}
