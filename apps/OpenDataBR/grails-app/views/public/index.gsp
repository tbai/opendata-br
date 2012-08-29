<!doctype html>
<html>
    <head>
        <meta name="layout" content="public"/>

        <title><g:message code="public.index.title"/></title>   
    
        <r:require modules="jquery"/>
        <style type="text/css">
            .ym-col1 { width: 228px; } /* left column */
            .ym-col2 { width: 0; } /* right column */
            .ym-col3 { margin-left: 228px; margin-right: 0; } /* center column */
        </style>
    </head>
    <body class="index">
        <div class="ym-column">
            <div class="ym-col1">
                <div class="ym-cbox">
                    <!-- Data menu -->
                    <h3><g:message code="datamenu.title"/></h3>
                    <br/>
                    <div id="top-menu" class="ym-vlist">
                      <ul>
                        <li>
                            <% def dataId;
                            %>
                            <span><g:message code="datamenu.subtitle.executivo_federal"/></span>
                            <ul>

                                <!-- despesas_executivo_federal -->
                                <li><a href="${createLink(controller:'DespesasExecutivoFederal', action:'icicleTree')}"
                                    target="data_frame">
                                    <g:message code="datamenu.despesas_executivo_federal"/>
                                </a></li>

                                <!-- servidores_executivo_federal -->
                                <li><a href="${createLink(controller:'data', action:'view', id:dataId)}">
                                    <g:message code="datamenu.servidores_executivo_federal"/>
                                </a></li>
                            </ul>
                        </li>
                      </ul>
                    </div>
                </div>
            </div>
            <div class="ym-col3">
                <div class="ym-cbox" id="dataContainer">
                    <div>
                        <iframe name="data_frame" src="" frameBorder="0" width="100%" height="400" scrolling="auto"></iframe>
                    </div>
                    <div id="commentsEl">
                        <h3>Comentários</h3>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>