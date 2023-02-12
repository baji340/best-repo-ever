({
    
    afterScriptLoad : function(component, event, helper) {
        
        
        var action = component.get("c.getChartData");
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('--chartData--', response.getReturnValue());
                
                
                var chartData = response.getReturnValue();
                
                console.log(chartData);
                
                
                if(!$A.util.isEmpty(chartData)){
                    
                    var chart1_Data = chartData[0];
                    var canvas1 = document.getElementById("colorCanvas")
                    
                    //**** START OF Chart 1 ****
                    var myChart1 = new Chart(canvas1, {
                        type: 'doughnut',
                        
                        data: {
                            labels: chart1_Data.dataLabels, //["label 1", "Label 2"]
                            datasets: [{
                                title: 'Chart 1',
                                backgroundColor: ["#bf1114","#ff750c","#ffff47","#037542", "#07127a"],
                                
                                data: chart1_Data.dataValues, //["10", "20"]
                            }] 
                            
                        },
                        options: {
                            maintainAspectRatio: false,
                            
                            title: {
                                display: true, 
                                position:"bottom",
                                text: "Chart 1",
                                
                            },
                            legend: {
                                display: true,
                                position: "top",
                                labels: {
                                    fontColor: "#333",
                                    fontSize: 12,
                                },
                                
                            },
                            
                            
                        }
                    });	
                    //**** END OF Chart 1 ****
                    
                    
                    var chart2_Data = chartData[1];
                    
                    var canvas2 = document.getElementById("fruitCanvas");
                    
                    //**** START OF Chart 2 ****
                    var myChart1 = new Chart(canvas2, {
                        type: 'doughnut',
                        
                        data: {
                            labels: chart2_Data.dataLabels, //["label 1", "Label 2"]
                            datasets: [{
                                title: 'Chart 1',
                                backgroundColor: ["#3cba9f","#8e5ea2","#3e95cd","#e8c3b9", "#f4426e"],
                                
                                data: chart2_Data.dataValues, //["10", "20"]
                            }] 
                            
                        },
                        options: {
                            maintainAspectRatio: false,
                            
                            title: {
                                display: true, 
                                position:"bottom",
                                text: "Chart 2",
                                
                            },
                            legend: {
                                display: true,
                                position: "top",
                                labels: {
                                    fontColor: "#333",
                                    fontSize: 12,
                                },
                                
                            },
                            
                            
                        }
                    });	
                    //**** END OF Chart 2 ****								
                }
                
                
                
            }
            
            
        });
        $A.enqueueAction(action);	
    }
    
})