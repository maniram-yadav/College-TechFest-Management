$(document).ready(function(){
	
	
	
	
var i=1;
var btnid;

function BackgroundImage(){
 
 $("#background").css('opacity','.6').removeClass("image"+i).fadeOut(100,function(){
	  
	
	 
	 ++i;
	  if(i==5)
          i=(6-i);
	  $("#background").addClass("image"+i).fadeIn(500).css('opacity','1');
	  });
	  
	  
	
setTimeout(BackgroundImage,7000);
	}
setTimeout(BackgroundImage,7000);

$("#register").click(function(){
	  
	
	   $(".register").show(function(){
	                $.ajax({
		          		url: "user/signup.jsp",
		          		method: "post",
		          		data: {message:""},
		          		success: function(result){
		          			$(".navbar").fadeOut(300,function(){
		          		    $(".mainhome").fadeOut(600,function(){
		          		  
		                       $(".register").html(result).fadeIn(900);
		          		                                           });
		                                         
		          			                            });
		          			}
		          	       });
			
		});
		
	
});





/*
$(".usernavba").css("background-image","url(/images/galaxy.jpg)");


$(".content").attr("src","../images/backgrnd.gif");
$(".content-move").attr("src","../images/cloudback1.gif");
*/



$("#participate").focus(function(){
	
	$(".profiledata").fadeOut(400);
	$(".unparticipate").fadeOut(600);
	$(".updatepassrd").fadeOut(400,function(){
	
		$(".popupboxbgrnd").fadeIn(2000);
	$(".popupbox").fadeIn(2000);
                                });
});


$("#unpart").click(function(){


	$(".profiledata").fadeOut(400);
	$(".popupboxbgrnd").fadeOut(600);
	$(".popupbox").fadeOut(600);
	$(".updatepassrd").fadeOut(400,function(){
	
		$(".unparticipate").addClass("profilecontent");
		$(".unparticipate").fadeIn(2000);
	
	});

	
	/*
	$(".popupbox").fadeOut(600);
	$(".profiledata").fadeOut(600);
	$(".updatepassrd").fadeOut(300,function(){
		
			$(".unparticipate").fadeIn(600);
		});
		*/
	});



$(".close").click(function(){
	
	$(".popupboxbgrnd").fadeOut(2000);
	$(".popupbox").fadeOut(2000);
	$(".profiledata").show(2000);      });





$(".updatepass").click(function(){
	
	$(".popupbox").fadeOut(400);
	$(".unparticipate").fadeOut(400);
	$(".profiledata").fadeOut(500,function(){
		
	$("updatepassrd").addClass("profilecontent");
	
    
	$.ajax({
      		url: "updatepassword.jsp",
      		method: "post",
      		success: function(result){
      		  
                   $(".updatepassrd").html(result).fadeIn(1000);
                        }
      	       });
	});
	});



$(".profileload").click(function(){
	$(".popupbox").fadeOut(600);
	$(".unparticipate").fadeOut(300);
	
	$(".updatepassrd").fadeOut(300,function(){
	$(".profiledata").fadeIn(1000);
	});
	
});







$(".loginbackground").css("background-image","../lback.jpg");

$('[name="ebttn"]').click(function(){
	
	$(".eventdescription").show(2000);
});

$("button").click(function() {
	
	if(btnid==undefined||btnid==null){
	
		$("#"+this.id).fadeIn(2000);
		
	//alert(btnid);
	}
	
	
	else{
	
		//alert(btnid);
		$("#"+btnid).hide(1000);
		
			$("#"+this.id).fadeIn(1500);

		
	}
	
	btnid=this.id;
    	
});


$(".contactus").css("background-image","../contact.jpg");
$(".termcond").css("background-image","../termcond.jpg");

$(".contactus").css("height",$(window).height()+'px');
$(".termcond").css("height",$(window).height()+'px');

$(".events").css("height",$(window).height()+'px');

$(".contactus").css("margin-top",($(document).height()-80)+'px');
$(".termcond").css("margin-top",($(document).height()-20)+'px');
$(".showforget").hide();



$("div#forgetpass").click(function(){

	$(".showlogin").fadeOut(1200,function(){
		$(".showforget").fadeIn(600);
		
	});
	
});



$(".imag").css("background-image","../images/fshield.gif");
$(".yantragene").css("background-image","../images/yantragene1.gif");




$(".close").click(function(){
	
	$(".message").fadeOut(500);
});

$(".alert-dismissable").click(
function(){
	
	$(".message").fadeOut(300);
});


});