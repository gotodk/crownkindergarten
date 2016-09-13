<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WUC_fordemohome_js_hg.ascx.cs" Inherits="adminht_corepage_WUC_fordemohome_js_hg" %>

 

    		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		    jQuery(function ($) {

		 
			 







			
				/////////////////////////////////////
				$(document).one('ajaxloadstart.page', function(e) {
					$tooltip.remove();
				});
			
			
			
			 
		 
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				});
		 

 
 

		 
			
			})
		</script>
    		<!-- 工作台相关 -->
		<script type="text/javascript">
		    jQuery(function ($) {

		      

			})
		</script>