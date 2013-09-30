var main = {};

jQuery( function($){
	console.log("-- Doc Ready Start --");

	$('a[data-toggle="tab"]').on('shown', function (e) {
		main.current_tab_id 	= String(e.target);
		main.previous_tab_id	= String(e.relatedTarget);

	  	main.current_tab_id 	= main.current_tab_id.substring(main.current_tab_id.search("#")+1); // activated tab
	  	main.previous_tab_id 	= main.previous_tab_id.substring(main.previous_tab_id.search("#")+1); // previous tab

	  	if(main.current_tab_id == "complete"){
	  		$("#configuration-content").hide();
	  	} else {
	  		$("#configuration-content").show();
	  	}
	});

	$('.fancybox').fancybox();
});

main.activateTab = function(_id){
	$('#pageTabs a[href="#' + _id + '"]').tab('show');
}

main.addConfigurationItem = function( _id, _label, _value ){
	_id 	= decodeURIComponent(_id);
	_label 	= decodeURIComponent(_label);
	_value	= decodeURIComponent(_value);

	var ul = $("#configuration-content #items"),
	li = $("<li/>").attr("data-id", _id ),
	label = $("<span/>").text( _label + ": "),
	val = $("<span/>").text( _value );
	

	$("#configuration-content #items li[data-id='" + _id + "']").remove();

	label.appendTo(li);
	val.appendTo(li);

	if(_id == "trailer"){
		li.addClass("trailer-item").prependTo(ul);
		main.activateTab("options");
	} else{
		//$("<a><i class='icon-trash'></i></a>").appendTo(li);

		li.appendTo(ul);
	}
}
