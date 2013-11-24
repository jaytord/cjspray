var main = {};
var selections = {};

main.price = {};

main.configuration_complete = false;
main.dealer = null;
main.promo = {code:"", discount:0};

jQuery( function($){
	//console.log("-- Doc Ready Start --");

	$('a[data-toggle="tab"]').on('shown', function (e) {
		main.current_tab_id 	= String(e.target);
		main.previous_tab_id	= String(e.relatedTarget);

	  	main.current_tab_id 	= main.current_tab_id.substring(main.current_tab_id.search("#")+1); // activated tab
	  	main.previous_tab_id 	= main.previous_tab_id.substring(main.previous_tab_id.search("#")+1); // previous tab

	  	main.isFinishTabActive();
	});

	$('.fancybox').fancybox();

	//click events
	$("#options button").click( main.optionSelected );
	$("#trailers li img").click( main.optionSelected );
	$("#accessories button").click( main.accessorySelected );
	$("span.checkmark").click( main.removeOptionClicked );
	$("#dealer-logout-btn").click(main.dealerLogOut);

	$('#dealer-login-form').submit(main.submitDealerLoginForm);
	$('#promo-code-form').submit(main.submitPromoCodeForm);

	//console.log("init, base url : " + base_url + ", total options : " + total_options);

	main.getSession();
	main.toInCompleteState();
});

main.download = function(){
	var createpdfform = $("form#createpdf");
	createpdfform.children('input#pdf-selections').eq(0).attr( "value", JSON.stringify(selections) );
	createpdfform.children('input#pdf-price').eq(0).attr( "value", JSON.stringify(main.price) );
	createpdfform.children('input#pdf-promo').eq(0).attr( "value", JSON.stringify(main.promo) );
	createpdfform.children('input#pdf-dealer_name').eq(0).attr( "value", JSON.stringify(main.dealer) );
	createpdfform.submit();

    return false;
}

main.startOver = function(){
	main.resetAll();
	main.activateTab("trailers");

    return false;
}

main.resetAll = function(){
	$(".btn.active").removeClass("active");
	selections = {options:{}, accessories:[]};
	main.updateAll();
	main.updateAccessoryItems();
}

main.updateAll = function(){
	main.updateMenuSelections();
	main.updateImages();
	main.updatePartNumber();
	main.updateOptionItems();
	main.updatePrice();
	main.updateExcludes();
	main.checkComplete();
}

main.submitPromoCodeForm = function(){
	$.ajax({
        type: 'POST',
        url: $(this).attr('action'),
        data: $(this).serialize(),
        dataType: "json",
        success: function (response) {
        	console.log(response);

            if(response.success){
            	main.promo.code = response.code;
            	main.promo.discount = response.discount;

            	if( !$("body").hasClass("promo") )
            		$("body").addClass("promo")

            	main.updatePrice();
            }else{
            	main.invalidPromoCode();
            }
        },
        error:function(error){
        	main.invalidPromoCode();
        }
    });

    return false;
}

main.invalidPromoCode = function(){
	alert("invalid promo code");
}

main.submitDealerLoginForm = function(){
	$.ajax({
        type: 'POST',
        url: $(this).attr('action'),
        data: $(this).serialize(),
        dataType: "json",
        success: function (response) {
        	alert(response);

            if(response.index){
            	main.dealer = response;
            	main.toLoggedInState();
            }else if(response == "failed"){
            	main.loginFailed();
            }
        },
        error:function(error){
        	main.loginFailed();
        }
    });

    return false;
}

main.loginFailed = function(){
	alert("login failed");
}

main.getSession = function(){
	$.ajax({
        type: 'POST',
        url: base_url + "auth/session",
        dataType: "json",
        success: function (response) {
            if(response.index && response.index != undefined){
            	main.dealer = response;
            	main.toLoggedInState();
            }else{
            	main.toLoggedOutState();
            	//console.log("no session");
            }
        }
    });
}

main.dealerLogOut = function(){
	$.ajax({
        type: 'POST',
        url: base_url + "auth/logout",
        success: function (response) {
            if(response == "success"){
            	main.dealer = null;
            	main.toLoggedOutState();
            }
        }
    });
}

main.removeOptionClicked = function(e){
	console.log(e.target);

	var _this = $(this);
	var _option_id = _this.parent().parent().parent().attr("data-id");
	main.removeSelection(_option_id);

	//console.log("remove option clicked");
}

main.toLoggedInState = function(){
	$("#dealer-login-form").hide();
	$("#user-info").show();
	$("#company-name").text( main.dealer.company_name );

	if( !$("body").hasClass("dealer") )
		$("body").addClass("dealer");

	main.updatePrice();
}

main.toLoggedOutState = function(){
	console.log("toLoggedOutState-");

	$("#dealer-login-form").show();
	$("#user-info").hide();
	$("#company-name").text("");

	if( $("body").hasClass("dealer") )
		$("body").removeClass("dealer");

	main.updatePrice();
}

main.activateTab = function(_id){
	$('#pageTabs a[href="#' + _id + '"]').tab('show');
}

main.isFinishTabActive = function(){
	if( main.current_tab_id == "complete" ){
		if( !$("#main-container").hasClass("complete") )
			$("#main-container").addClass("complete");
	} else{
		if( $("#main-container").hasClass("complete") )
			$("#main-container").removeClass("complete");
	}
}

main.optionSelected = function(e){
	console.log(e.target);

	_this 	= $(this);

	if(_this.parent().hasClass("thumbnail"))
		_this 	= $(this).parent("div.thumbnail").parent("li.trailer");

	_option_index 	= decodeURIComponent( _this.attr("data-option-index") );
	_option_id 		= decodeURIComponent( _this.attr("data-option-id") );
	_option_label	= decodeURIComponent( _this.attr("data-option-label") );
	_id 			= decodeURIComponent( _this.attr("data-id") );
	_cj_price		= Number(_this.attr("data-cj-price"));
	_list_price		= Number(_this.attr("data-list-price"));
	_dealer_price	= Number(_this.attr("data-dealer-price"));
	_label 			= decodeURIComponent( _this.attr("data-label") );

	if( !selections.options || selections.options == undefined )
	 	selections.options = {};

	selections.options[_option_id] = { 
		index: _option_index, 
		label: _option_label,
		value:
		{
			id: _id, 
			cj_price: _cj_price, 
			list_price: _list_price, 
			dealer_price: _dealer_price,
			label: _label
		}
	};

	main.updateAll();

	//close menus
	$(".accordion-body.collapse.in").collapse("hide");

	//if trailer
	if(_option_id == "B")
		main.activateTab("options");
}

main.updateImages = function(){
	selections.images = [];

	$(".image-container").children().remove();

	var trailer = "";
	$.each(selections.options, function( _i, _v ){
		var ext = "png";
		var src = "";

		if(_i == "B"){
			trailer = "B-" + _v.value.id;
			ext = "jpg";
			
			src = base_url + "img/" + trailer + "." + ext;
		} else {
			if(trailer != ""){
				src = base_url + "img/" + trailer + "_" + _i + "-" + _v.value.id + "." + ext;
			}
		}

		selections.images.push( {type: ext, filename:src} );

		var _image = new Image();
		_image.onerror = function(e){
			e.target.src = base_url + "img/blank.png";
		}
		_image.onload = function(e){
			$(".image-container").append(e.target);
		}

		_image.src = src;

		console.log("image : " + _i + "-" + _v.value.id);
		//console.log(selections.images);
	});
}

main.updateMenuSelections = function(){
	//remove all first
	$("div.accordion-group").each(function(){
		var _this = $(this);
		var _a = _this.find(".accordion-heading a");

		if(_this.hasClass("selected"))
			_this.removeClass("selected");

		_a.find("span.selection").text("");
	});

	$.each(selections.options, function( _i, _v ){
		var acc_group = $("div.accordion-group[data-id="+_i+"]");
		var acc_a = acc_group.find(".accordion-heading a");

		if(!acc_group.hasClass("selected"))
			acc_group.addClass("selected");

		acc_a.find("span.selection").text( _v.value.label );
	});
}

main.removeSelection = function( _option_id ){
	if( selections.options[_option_id] && 
		selections.options[_option_id].value )
	{
		//console.log("removing option :::: " + _option_id);

		delete selections.options[_option_id];

		////console.log(selections.options);

		
		main.updateAll();
	}
	
	$("div.accordion-group[data-id='" + _option_id + "'] button.active").removeClass("active");
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
					label: decodeURIComponent( _this.attr("data-label") ),
					list_price: Number(_this.attr("data-list-price")), 
					cj_price: Number(_this.attr("data-cj-price")), 
					dealer_price: Number(_this.attr("data-dealer-price")),
				});
			}
		});

		main.updateAccessoryItems();
		main.updatePrice();
	},100);
}

main.updateAccessoryItems = function(){
	$(".configuration-content .accessories li").remove();

	$.each(selections.accessories, function( _i, _v ){
		var ul 	= $(".configuration-content .accessories"),
		li 		= $("<li/>").attr("data-id", _v.id ),
		val 	= $("<span/>").text( _v.label ),
		price 	= $("<span/>").text("$"+ $.strToCommaDelimNumber(_v.list_price.toFixed(2)) ).addClass("price");

		val.appendTo(li);
		price.appendTo(li);
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
		price 	= $("<span/>").text("$"+ $.strToCommaDelimNumber(_v.value.list_price.toFixed(2)) ).addClass("price");

		label.appendTo(li);
		val.appendTo(li);
		price.appendTo(li);
		li.appendTo(ul);
	});

	main.checkConfigurationSelections();

	$.sortItemsByAttribute("#mini-configuration .items li", "data-index", true);
	$.sortItemsByAttribute("#mini-configuration .items li", "data-index", true);
}

main.updatePartNumber = function(){
	//remove all first
	$(".configuration-content .part-number li").each(function(){
		$(this).children("span").remove();

		if(!$(this).hasClass("inactive")){
			$(this).addClass("inactive");
		}
	});

	$.each(selections.options, function( _i, _v ){
		li 		= $(".configuration-content .part-number li[data-id=" + _i + "]"),
		label 	= $("<span/>").text( _i ).addClass("lbl"),
		val 	= $("<span/>").text( _v.value.id );

		if( li.hasClass("inactive") ){
			li.removeClass("inactive");
		}

		label.appendTo(li);
		val.appendTo(li);
	});

	$.sortItemsByAttribute("#mini-configuration .part-number li", "data-index", true);
	$.sortItemsByAttribute("#full-configuration .part-number li", "data-index", true);

	//console.log("total part numbers : " + $("#mini-configuration .part-number li").length );
}

main.updatePrice = function(){
	main.price.list = 0;
	main.price.dealer = 0;
	main.price.cj = 0;


	if(selections.options){
		$.each(selections.options, function( _i, _v ){
			main.price.list += Number(_v.value.list_price);
			main.price.dealer += Number(_v.value.dealer_price);
			main.price.cj += Number(_v.value.cj_price);
		});
	}
	
	if(selections.accessories){
		$.each(selections.accessories, function( _i, _v ){
			main.price.list += Number(_v.list_price);
			main.price.dealer += Number(_v.dealer_price);
			main.price.cj += Number(_v.cj_price);
		});
	}

	main.price.list 	= main.price.list.toFixed(2);
	main.price.dealer 	= main.price.dealer.toFixed(2);
	main.price.cj 		= main.price.cj.toFixed(2);

	$(".configuration-content .list-price span").text( "$" + $.strToCommaDelimNumber(main.price.list) );
	
	var label = main.dealer ? "Dealer Price" : "CJ Price";
	var price = main.dealer ? main.price.dealer : main.price.cj;

	main.price.you =  price - Math.round(price*main.promo.discount);

	$(".configuration-content .cj-price h3").html( label + "<span></span>");
	$(".configuration-content .cj-price span").text( "$" + $.strToCommaDelimNumber(price) );
	$(".configuration-content .promo-code h4").html("Promo Discount : " + String(main.promo.code) + "<span></span>");
	$(".configuration-content .promo-code h4 span").text( main.promo.discount * 100 + "%");
	$(".configuration-content .your-price span").text( "$" + $.strToCommaDelimNumber(main.price.you.toFixed(2)) );
}

main.updateExcludes = function(){
	$("div.choice").css("display","block");

	$.each(selections.options, function( _i, _v ){
		var key = (_i + "-" + _v.value.id).toUpperCase();

		$("div.choice." + key ).each(function(){
			var choice_btn = $(this).children("button").eq(0);
			var choice_id = choice_btn.attr("data-id");
			var choice_option_id = choice_btn.attr("data-option-id");

			//hide it
			$(this).css( "display", "none" );

			//remove it from selections if it's active.
			if( choice_btn.hasClass("active") )
				main.removeSelection(choice_option_id);

			//console.log( choice_option_id + ":" + choice_id + ":" + choice_btn.hasClass("active") );
		});
	});
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

main.toCompleteState = function(){
	if( !$("body").hasClass("complete") ){
		$("body").addClass("complete");
	}

	$(".require-complete").attr("disabled",false);
}

main.toInCompleteState = function(){
	if( $("body").hasClass("complete") ){
		$("body").removeClass("complete");
	}

	$(".require-complete").attr("disabled",true);
}

main.checkComplete = function(){
	if( selections.options ){
		main.configuration_complete = Object.keys(selections.options).length == total_options;

		if( main.configuration_complete ){
			main.toCompleteState();
		} else {
			main.toInCompleteState();
		}
	}
}