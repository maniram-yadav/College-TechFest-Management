$(document).ready(function(){
	
	

var className;
		
		if(className!=null&&className!=undefined)
		{		
			$("."+className).hide(100,function(){
				
				   $(".contactus").fadeIn(500);
				   className="contactus";
			            
			       });
		
		}
		else
			{
			    $(".mainhome").fadeOut(300,function(){
				$(".contactus").fadeIn(500);
				className="contactus";
			    });
			}
	});


		$("#termcond").click(function(){
			if(className!=null&&className!=undefined)
			{		
				$("."+className).hide(100,function(){
					
					   $(".termcond").fadeIn(500);
					   className="termcond";
				            
				       });
			
			}
			else
				{
				$(".mainhome").fadeOut(300,function(){
					$(".termcond").fadeIn(500);
					className="termcond";
				});
				}
			
		});
		
		$("#events").click(function(){
			
			if(className!=null&&className!=undefined)
			{		
				$("."+className).hide(100,function(){
					
					   $(".events").fadeIn(500);
					   className="events";
				            
				       });
			
			}
			else
				{
				$(".mainhome").fadeOut(300,function(){
					$(".events").fadeIn(500);
					className="events";
				});
				}
		

});