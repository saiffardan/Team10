	
        <script>
            function testFunction() {
                var i;
                var stg = "<%= stage %>";
                //var stage;
                // Saif - This is a temporary functionality which shows how progress bars will look like
                // - A dynamic solution to change more than one progress bar at once
                for (i = 1; i <= n; i++) { 
                    //alert(stg);
                    //stage = Math.floor((Math.random() * 4) + 1);
                    if(stg === "New"){
                        document.getElementById("progBar" + i).style.width = "20%";
                        document.getElementById("progBar" + i).innerHTML = "New";
                        document.getElementById("progBar" + i).className = "progress-bar bg-danger progress-bar-striped progress-bar-animated";
                    } else if (stg === "Internal Moderation") {
                        document.getElementById("progBar" + i).style.width = "40%";
                        document.getElementById("progBar" + i).innerHTML = "Internal Moderation";
                        document.getElementById("progBar" + i).className = "progress-bar bg-warning progress-bar-striped progress-bar-animated";
                    } else if (stg === "External Vetting") {
                        document.getElementById("progBar" + i).style.width = "60%";
                        document.getElementById("progBar" + i).innerHTML = "External Vetting";
                        document.getElementById("progBar" + i).className = "progress-bar bg-info progress-bar-striped progress-bar-animated";
                    } else if (stg === "External Moderation") {
                        document.getElementById("progBar" + i).style.width = "80%";
                        document.getElementById("progBar" + i).innerHTML = "External Moderation";
                        document.getElementById("progBar" + i).className = "progress-bar bg-success progress-bar-striped progress-bar-animated";
                    } else if (stg === "Completed") {
                        document.getElementById("progBar" + i).style.width = "100%";
                        document.getElementById("progBar" + i).innerHTML = "Completed";
                        document.getElementById("progBar" + i).className = "progress-bar bg-success progress-bar-striped progress-bar-animated";
                    }
//                            if(document.getElementById("progBar" + i).style.width === "0%"){
//                                document.getElementById("progBar" + i).style.width = "25%";
//                            }else if(document.getElementById("progBar" + i).style.width === "25%") {
//                                document.getElementById("progBar" + i).style.width = "50%"; 
//                            }else if(document.getElementById("progBar" + i).style.width === "50%") {
//                                document.getElementById("progBar" + i).style.width = "75%"; 
//                            }else if(document.getElementById("progBar" + i).style.width === "75%") {
//                                document.getElementById("progBar" + i).style.width = "100%"; 
//                            }else if(document.getElementById("progBar" + i).style.width === "100%") {
//                                document.getElementById("progBar" + i).style.width = "0%"; 
//                            }
                }
            }
	</script>