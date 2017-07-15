$(document).ready(function(){
	
	if (screen.width < 750) { 

    $(".imag").hide();
    $(".yantragene").hide();
 }

	
	
	
	
	

	$("#register").click(function(){
		  
		   $(".register").show(function(){
		                $.ajax({
			          		url: "user/signup.jsp",
			          		method: "post",
			          		data: {message:""},
			          		success: function(result){
			          		    $(".mainhome").hide(900);
			          		  
			                       $(".register").html(result);
			                                         }
			          	       });
				
			});
			
		
			
	});

	
	
	
});