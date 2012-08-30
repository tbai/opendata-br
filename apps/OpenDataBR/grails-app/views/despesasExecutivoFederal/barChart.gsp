<!doctype html>
<html lang="pt">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Gráfico</title>

        <r:require module="jit"/>
        <r:layoutResources/>

        <link type="text/css" href="${resource(dir:'Jit/Examples/css/', file:'base.css')}" rel="stylesheet" />
        <link type="text/css" href="${resource(dir:'Jit/Examples/css/', file:'BarChart.css')}" rel="stylesheet" />

        
        <style>
            .clearfix:after {
                content: ".";
                display: block;
                clear: both;
                visibility: hidden;
                line-height: 0;
                height: 0;
            }
             
            .clearfix {
                display: inline-block;
            }
             
            html[xmlns] .clearfix {
                display: block;
            }
             
            * html .clearfix {
                height: 1%;
            }
            html, body {
                background:white;
            }
            #id-list{
                padding:10px;
            }
            #id-list li{
                float:left; display:block; width:400px;
                font-size:10px;
            }
        </style>

        <r:script>
            var labelType, useGradients, nativeTextSupport, animate;

            (function() {
              var ua = navigator.userAgent,
                  iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
                  typeOfCanvas = typeof HTMLCanvasElement,
                  nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
                  textSupport = nativeCanvasSupport 
                    && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
              //I'm setting this based on the fact that ExCanvas provides text support for IE
              //and that as of today iPhone/iPad current text support is lame
              labelType = (!nativeCanvasSupport || (textSupport && !iStuff))? 'Native' : 'HTML';
              nativeTextSupport = labelType == 'Native';
              useGradients = nativeCanvasSupport;
              animate = !(iStuff || !nativeCanvasSupport);
            })();
            $(document).ready(function(){
                var json = ${jsonData};
                //console.log(json);

                var barChart = new $jit.BarChart({  
                  //id of the visualization container  
                  injectInto: 'chartEl',  
                  //whether to add animations  
                  animate: true,  
                  //horizontal or vertical barcharts  
                  orientation: 'vertical',  
                  //bars separation  
                  barsOffset: 20,  
                  //visualization offset  
                  Margin: {  
                    top:5,  
                    left: 5,  
                    right: 5,  
                    bottom:5  
                  },  
                  //labels offset position  
                  labelOffset: 5,  
                  //bars style  
                  type: useGradients? 'stacked:gradient' : 'stacked',  
                  //whether to show the aggregation of the values  
                  showAggregates:true,  
                  //whether to show the labels for the bars  
                  showLabels:true,  
                  //labels style  
                  Label: {  
                    type: labelType, //Native or HTML  
                    size: 13,  
                    family: 'Arial',  
                    color: 'black'  
                  },  
                  //add tooltips  
                  Tips: {  
                    enable: true,  
                    onShow: function(tip, elem) {  
                      tip.innerHTML = "<b>" + elem.name + "</b>: " + elem.value;  
                    }  
                  },
                  Events: {
                    enable: true,
                    onClick: function(node, eventInfo, e) {  
                        if(eventInfo.contains && node && node.name && node.value){
                            alert("nome: " + node.name + "\nano:" + node.label);
                        }
                        
                    }
                  }
                });  

                //load JSON data.  
                barChart.loadJSON(json);  

                
                //end
                var list = $jit.id('id-list');
                //update json on click 'Update Data'
                
                //dynamically add legend to list
                var legend = barChart.getLegend(),
                    listItems = [];

                for(var name in legend) {
                  listItems.push('<div class=\'query-color\' style=\'background-color:'
                      + legend[name] +'\'>&nbsp;</div>' + name);
                }
                list.innerHTML = '<li>' + listItems.join('</li><li>') + '</li>';
                
            });
        </r:script>
    </head>
    <body>
        <div style="width:830px;">
            <div style="padding:0px;">
                <div id="chartEl" style="width:100%; height:350px;"></div>
            </div>
            <br/>
            <div id="legend" >
                Valores representados em milhões de reais. Ex.: 1 = R$ 1.000.000,00
                <ul id="id-list" style="margin:0;" class="clearfix"></ul>
            </div>
        </div>

        <r:layoutResources/>
    </body>
</html>