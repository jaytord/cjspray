var main = {};
var selections = {};

main.price = {};

jQuery( function($){
	console.log("-- Doc Ready Start --");

	$('a[data-toggle="tab"]').on('shown', function (e) {
		main.current_tab_id 	= String(e.target);
		main.previous_tab_id	= String(e.relatedTarget);

	  	main.current_tab_id 	= main.current_tab_id.substring(main.current_tab_id.search("#")+1); // activated tab
	  	main.previous_tab_id 	= main.previous_tab_id.substring(main.previous_tab_id.search("#")+1); // previous tab

	  	main.checkComplete();
	});

	$('.fancybox').fancybox();

	//click events
	$("#options button").click( main.optionSelected );
	$("#trailers li img").click( main.optionSelected );
	$("#accessories button").click( main.accessorySelected );
});

main.activateTab = function(_id){
	$('#pageTabs a[href="#' + _id + '"]').tab('show');
}

main.optionSelected = function(){
	_this 	= $(this).parent("div.thumbnail").parent("li.trailer");

	_option_index 	= decodeURIComponent( _this.attr("data-option-index") );
	_option_id 		= decodeURIComponent( _this.attr("data-option-id") );
	_option_label	= decodeURIComponent( _this.attr("data-option-label") );
	_id 			= decodeURIComponent( _this.attr("data-id") );
	_price			= decodeURIComponent( _this.attr("data-price") );
	_dealer_price	= decodeURIComponent( _this.attr("data-dealer-price") );
	_label 			= decodeURIComponent( _this.attr("data-label") );

	//update menu selection
	var acc_group = $("div.accordion-group[data-id="+_option_id+"]");
	var acc_a = acc_group.find(".accordion-heading a");

	if(!acc_group.hasClass("selected")){
		acc_group.addClass("selected");
	}

	acc_a.find("span").remove();
	acc_a.append("<span class='selection'> : "+ _label +"</span>");


	if( !selections.options || selections.options == undefined )
	 	selections.options = {};

	selections.options[_option_id] = { 
		index: _option_index, 
		label: _option_label,
		value:
		{
			id: _id, 
			price: _price, 
			dealerprice: _dealer_price,
			label: _label
		}
	};

	main.updatePartNumber();
	main.updateOptionItems();
	main.updatePrice();

	//if trailer
	if(_option_id == "b")
		main.activateTab("options");
}

main.accessorySelected = function(){
	selections.accessories = [];

	setTimeout(function(){
		$("#accessories button").each(function(){
			var _this = $(this);

			if(_this.hasClass("active")){
				selections.accessories.push(
				{
					id: decodeURIComponent( _this.attr("data-id") ),
					label: decodeURIComponent( _this.attr("data-label") )
				});
			}
		});

		main.updateAccessoryItems();
	},100);
}

main.updateAccessoryItems = function(){
	$(".configuration-content .accessories li").remove();

	$.each(selections.accessories, function( _i, _v ){
		var ul 	= $(".configuration-content .accessories"),
		li 		= $("<li/>").attr("data-id", _v.id ),
		val 	= $("<span/>").text( _v.label );

		val.appendTo(li);
		li.appendTo(ul);
	});
}

main.updateOptionItems = function(){
	$(".configuration-content .items li").remove();

	$.each(selections.options, function( _i, _v ){
		var ul 	= $(".configuration-content .items"),
		li 		= $("<li/>").attr("data-id", _i ).attr("data-index", _v.index ),
		label 	= $("<span/>").text( _v.label + ": ").addClass("lbl"),
		val 	= $("<span/>").text( _v.value.label ),
		price 	= $("<span/>").text("$"+ delimitNumbers(_v.value.price) ).addClass("price");

		label.appendTo(li);
		val.appendTo(li);
		price.appendTo(li);
		li.appendTo(ul);
	});

	main.checkConfigurationSelections();

	main.sortItemsByDataIndex("#mini-configuration .items", "#mini-configuration .items li");
	main.sortItemsByDataIndex("#full-configuration .items", "#full-configuration .items li");
}

main.updatePartNumber = function(){
	$.each(selections.options, function( _i, _v ){
		$(".configuration-content .part-number li[data-id="+_i+"]").remove();

		var ul 	= $(".configuration-content .part-number"),
		li 		= $("<li/>").attr("data-id", _i ).attr("data-index", _v.index ),
		label 	= $("<span/>").text( _i ).addClass("lbl"),
		val 	= $("<span/>").text( _v.value.id );

		label.appendTo(li);
		val.appendTo(li);
		li.appendTo(ul);
	});

	main.sortItemsByDataIndex("#mini-configuration .part-number","#mini-configuration .part-number li");
	main.sortItemsByDataIndex("#full-configuration .part-number","#full-configuration .part-number li");
}

main.updatePrice = function(){
	main.price.retail = 0;
	main.price.dealer = 0;

	$.each(selections.options, function( _i, _v ){
		main.price.retail += Number(_v.value.price);
		main.price.dealer += Number(_v.value.dealer_price);
	});

	main.price.retail = main.price.retail.toFixed(2);
	main.price.dealer = main.price.dealer.toFixed(2);

	$(".configuration-content h3 span.price").text( "$" + delimitNumbers(main.price.retail) );
}

main.sortItemsByDataIndex = function( _list, _items ){
	$(_items).sort( function(a,b){
		return parseInt( $(a).attr("data-index") ) > parseInt( $(b).attr("data-index") ) ? 1 : -1; 
	}).appendTo( $(_list) ); 
}

main.checkConfigurationSelections = function(){
	if( Object.keys( selections.options ).length > 0 ){
		if( $("#main-container").hasClass("no-selections") )
			$("#main-container").removeClass("no-selections");
	} else{
		if( !$("#main-container").hasClass("no-selections") )
			$("#main-container").addClass("no-selections");
	}
}

main.checkComplete = function(){
	if( main.current_tab_id == "complete" ){
		if( !$("#main-container").hasClass("complete") )
			$("#main-container").addClass("complete");
	} else{
		if( $("#main-container").hasClass("complete") )
			$("#main-container").removeClass("complete");
	}
}

function delimitNumbers(str) {
	return (str + "").replace(/\b(\d+)((\.\d+)*)\b/g, function(a, b, c) {
		return (b.charAt(0) > 0 && !(c || ".").lastIndexOf(".") ? b.replace(/(\d)(?=(\d{3})+$)/g, "$1,") : b) + c;
	});
}