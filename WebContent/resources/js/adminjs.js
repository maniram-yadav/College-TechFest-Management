$(document).ready(function(){
var className;


$(".upevent").click(function(){	
	
	var ename;
	ename=$(".ename").val();
	 $.ajax({
		url:"updateevent.jsp",
		method:"post",
		data:{"ename":ename},
		
		success:function(result){
			
			
			   if(className!=null&&className!=undefined)
     	        {
				   	   
	                    $("."+className).fadeOut(300,function(){
                        $(".updateinfo").html(result).fadeIn(500);
			            className="updateinfo";
	                                                          });
	
		         }
				{
					$(".updateinfo").html(result).fadeIn(500);
					className="updateinfo";
				}
		}
	});
});


	$("#regadmin").click(function(){
		if(className!=null&&className!=undefined)
		{		
			$("."+className).hide(100,function(){
				
				   $(".regadmin").fadeIn(500);
				   className="regadmin";
			            
			       });
		
		}
		else
			{
				$(".regadmin").fadeIn(500);
				className="regsdmin";
			}
		
	});
	
	$("#enew").click(function(){
		
		$.ajax({
			url:"../event/AddEvent.jsp",
			method:"post",
			success:function(result){
				
				   if(className!=null&&className!=undefined)
            	   {
		$("."+className).fadeOut(300,function(){
			
				$(".admincontent").html(result).fadeIn(300);
				className="admincontent";
		                                      });	
            	   }
                else{
            	   $(".admincontent").html(result).fadeIn(300);
   				className="admincontent";
   				    	   
            	   
                      }
	
			}
			
		});
	});

	
	$("#eupdate").click(function(){
		
		$.ajax({
			url:"selectevent.jsp",
			method:"post",
			
			success:function(result){
                       
				if(className!=null&&className!=undefined)
                    	   {
				$("."+className).fadeOut(300,function(){
					
				$(".updateevent").html(result).fadeIn(300);
			
				className="updateevent";
				});	
                    	   }
                       else{
                    	   $(".updateevent").html(result).fadeIn(300);
           				className="updateevent";
           				    	   
                    	   
                       }
			}
		
		});
	});

	
	
	$("#edelete").click(function(){
		

		if(className!=null&&className!=undefined)
		{		
			$("."+className).hide(100,function(){
				className="edelete";
		           $(".edelete").fadeIn(500);
		         });
		
		}
		else
			{
				$(".edelete").fadeIn(500);
				className="edelete";
			}
	});


	
	$("#students").click(function(){
	
		if(className!=null&&className!=undefined)
		{		
			$("."+className).hide(100,function(){
				className="students";
		           $(".students").fadeIn(500);
		         });
		
		}
		else
			{
				$(".students").fadeIn(500);
				className="students";
			}
		
	
});
	
	    $(".close").click(function(){
	    	
	    	$(".alert").fadeOut(500);
	    });
	    
	    $(".alert-dismissable").click(
	    function(){
	    	
	    	$(".alert-dismissable").fadeOut(300);
	    }		
	    
	    );
	
});