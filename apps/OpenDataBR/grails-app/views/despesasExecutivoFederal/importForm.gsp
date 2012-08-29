<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Importar arquivo de dados</title>
    </head>
    <body>
        <div class="content" role="main">
            <h1>Importar arquivo de dados</h1>
            <br/>

            <g:uploadForm action="uploadDataFile">
                <fieldset class="form">
                    <label>Ano: </label><g:datePicker name="ano" value="${new Date()}"
                      precision="year" years="${1980..(new Date().year +1900)}"/>
                    <input type="file" name="myFile" />
                    <input type="submit" />
                </fieldset>
            </g:uploadForm>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:elseif test="${flash.error}">
                <div class="errors" role="alert">${flash.error}</div>
            </g:elseif>
            <br/><br/>
            <br/><br/>
        </div>
    </body>
</html>