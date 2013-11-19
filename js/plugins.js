// Avoid `console` errors in browsers that lack a console.
(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];

        // Only stub undefined methods.
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());


(function($) {
    $.extend({
        strToCommaDelimNumber: function(str) {
            return (str + "").replace(/\b(\d+)((\.\d+)*)\b/g, function(a, b, c) {
                return (b.charAt(0) > 0 && !(c || ".").lastIndexOf(".") ? b.replace(/(\d)(?=(\d{3})+$)/g, "$1,") : b) + c;
            });
        },
        sortItemsByAttribute: function( _items, _attr, _int ){
            _list =  $(_items).parent();

            $(_items).sort( function(a,b){
                if(_int)
                    return parseInt( $(a).attr(_attr) ) > parseInt( $(b).attr(_attr) ) ? 1 : -1; 
                else
                    return $(a).attr(_attr) > $(b).attr(_attr) ? 1 : -1; 
            }).appendTo( $(_list) ); 
        }
    });
})(jQuery);