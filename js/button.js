// JavaScript Document


$(function() {
	$("li").click(function(e) {
		e.preventDefault();
		$("li").removeClass("selected");
		$(this).addClass("selected");

               className = $(this).find('a').attr('class');
               
               
	       switch(className)
              	{
                  case 'home':
                      $("#content").load("home.html");
                      break;
                  case 's1':
                      $("#content").load("step_one.html");
                      break;
                  case 's2':
                      $("#content").load("step_two.html");
                      break;
                  case 's3':
                      $("#content").load("step_three.html");
                      break;
                  case 's4':
                      $("#content").load("step_four.html");
                      break;
                  case 's5':
                      $("#content").load("step_five.html");
                      break;
                  case 'ch':
                      $("#content").load("church.html");
                      break;
                  case 'co':
                      $("#content").load("contact.html");
                      break;
                  case 're':
                      $("#content").load("resource.html");
                      break;                      
                  default:
              	}
            });
	
		});