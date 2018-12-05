(function ($) {


    $.fn.editableselect = function () {

        var arrowImage = '/media/images/select_arrow.gif'; // Regular arrow
        var arrowImageOver = '/media/images/select_arrow_over.gif'; // Mouse over
        var arrowImageDown = '/media/images/select_arrow_down.gif'; // Mouse down 
        var activeOption;
        var selectBoxIds = 0;
        var tbox = $(this);
        var optionList = $(this).attr("title").split(',');
        this.addClass("selectBoxInput");
        var div = $("<div/>").css({
            'float': 'left',
             width: tbox.width() + 16 + 'px',
             'id': 'selectbox',
              position:"relative"
        });

        var parent = tbox.parent();
        
        parent.prepend(div);
        
        tbox.unwrap().appendTo(div);
        
        div.addClass('selectBox');
        div.css("z-index", 1000);
        
        var img = $("<img/>", {
            'id': "arrowSelectBox",
            src: arrowImage,
            'class': 'selectBoxArrow',

        });


        img.mouseover(function () {
            $(this).attr("src", arrowImageOver);
        });
        img.mouseout(function () {

            $(this).attr("src", arrowImage);

        });
        img.click(function () {

            if ($("#" + 'selectBoxOptions').css("display") == 'block') {

                $(this).attr("src", arrowImageOver);
                $("#" + 'selectBoxOptions').css("display", "none");


            } else {
                $(this).attr("src", arrowImageDown);
                $("#" + 'selectBoxOptions').css("display", "block");
            }

        });

        div.append(img);

        var optionDiv = $("<div/>", {
            id: 'selectBoxOptions',
            'class': 'selectBoxOptionContainer'
        }).css({ width: div.width() - 2 + 'px',
            display: "none"
        });

        div.append(optionDiv);
        
        if(navigator.userAgent.indexOf('MSIE')>=0){
            
			var iframe = $('<IFRAME src="about:blank" frameborder=0>', {
			    
                width:optionDiv.width(),
                height:optionDiv.height(),
                id:"selectBoxFrame",

			}).css("display","none");
            
			div.append(iframe);
            
		}

        var k = 0;
        
        

        for (k = 0; k < optionList.length; k++) {

            var option = $("<div/>", {
                'class': 'selectBoxAnOption'
            }).css({
                width: optionDiv.width() - 2 + "px"
            }).html(optionList[k]);
            var optionSelectAction = function () {

                if($(this).css('backgroundColor')=='#316AC5'){
                    $(this).css('backgroundColor', '');
                    $(this).css('color', '');
                }
                else{
			
                    $(this).css('backgroundColor', '#316AC5');
                    $(this).css('color', '#FFF');
            
                }	
		
                if(activeOption){
                    activeOption.style.backgroundColor='';
                    activeOption.style.color='';			
                }
                activeOption = this;

            };

            option.on("mouseover", optionSelectAction);
            /*option.mouseover(optionSelectAction);
            option.keydown(optionSelectAction);*/

            option.click(function() {

                $(this).parent().parent().find(":text").val($(this).html());
                $(this).parent().css("display", "none");
                


            });


            optionDiv.append(option);
        }
        


        
        
        selectBoxIds = selectBoxIds + 1;


    };
})(jQuery);
    
