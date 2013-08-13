var main = {};


jQuery( function($){
	console.log("-- Doc Ready Start --");

	$('a[data-toggle="tab"]').on('shown', function (e) {
		main.current_tab_id 	= String(e.target);
		main.previous_tab_id	= String(e.relatedTarget);

	  	main.current_tab_id 	= main.current_tab_id.substring(main.current_tab_id.search("#")+1); // activated tab
	  	main.previous_tab_id 	= main.previous_tab_id.substring(main.previous_tab_id.search("#")+1); // previous tab
	  	console.log("tab changed : " + main.current_tab_id + " : " + main.previous_tab_id);

	  	if(main.current_tab_id == "complete" || main.current_tab_id == "home"){
	  		$("#pageTabs").hide();
	  		$("#configuration-content").hide();
	  		$("#main-content").attr("class","span12");
	  	} else {
	  		$("#pageTabs").show();
	  		$("#configuration-content").show();
	  		$("#main-content").attr("class","span8");
	  	}
	});

	$('.fancybox').fancybox();
});

main.activateTab = function(_id){
	$('#pageTabs a[href="#' + _id + '"]').tab('show');
}
