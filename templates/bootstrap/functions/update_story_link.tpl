<script type="text/javascript">
var save_lang_text="{#PLIGG_MiscWords_Save_Links_Save#}";
var remove_lang_text="{#PLIGG_MiscWords_Save_Links_Remove#}";
var UserURLSave="{$user_url_saved}";
{literal}

 $(function() {
    $(".favorite").click(function() 
    {
	
	  var oparation = $(this).attr("id");
	  var return_value="";
	  var link_id=$(this).attr("linkid");
	  var dataString = 'action='+oparation+'&link_id='+link_id;
	  var message="";
	  link_title=$(this).attr("title");
	  var parent = $(this);
	 
	 
	  
	  $.ajax({
	  type: "POST",
	  url:my_base_url+my_pligg_base+"/user_add_remove_links.php",
	  data: dataString,
	  beforeSend: function() {
      	parent.addClass("loader");
        },
	
	
	  cache: false,
	
	  success: function(html)
		{
		  
		  return_value=html;
		  if(return_value==1){
		    parent.attr('id','remove');
			message='Saved '+link_title+' from <a href="'+UserURLSave+'">Favorites</a>.';
			parent.html(remove_lang_text);
		  }else if(return_value==2){
		    parent.attr('id','add');
			message='Removed '+link_title+' from <a href="'+UserURLSave+'">Favorites</a>.';
		    parent.html(save_lang_text);
		  }else{
		   parent.html(html); 
		   message="error!";
		  }
		  
		  $.pnotify({
						pnotify_text: message,
						pnotify_sticker: false,
						pnotify_history: false,
						pnotify_notice_icon: 'icon-star-empty'
					});

		  parent.removeClass("loader");
		 
		} 
		
		
	  });
               					
      
  	return false;
  
    });
	
	
  });



{/literal}
</script>