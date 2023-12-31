(function ($) {
    "use strict";

    $(document).ready(function($){
        
        // testimonial sliders
        $(".testimonial-sliders").owlCarousel({
            items: 1,
            loop: true,
            autoplay: true,
            responsive:{
                0:{
                    items:1,
                    nav:false
                },
                600:{
                    items:1,
                    nav:false
                },
                1000:{
                    items:1,
                    nav:false,
                    loop:true
                }
            }
        });

        // homepage slider
        $(".homepage-slider").owlCarousel({
            items: 1,
            loop: true,
            autoplay: true,
            nav: true,
            dots: false,
            navText: ['<i class="fas fa-angle-left"></i>', '<i class="fas fa-angle-right"></i>'],
            responsive:{
                0:{
                    items:1,
                    nav:false,
                    loop:true
                },
                600:{
                    items:1,
                    nav:true,
                    loop:true
                },
                1000:{
                    items:1,
                    nav:true,
                    loop:true
                }
            }
        });

        // logo carousel
        $(".logo-carousel-inner").owlCarousel({
            items: 4,
            loop: true,
            autoplay: true,
            margin: 30,
            responsive:{
                0:{
                    items:1,
                    nav:false
                },
                600:{
                    items:3,
                    nav:false
                },
                1000:{
                    items:4,
                    nav:false,
                    loop:true
                }
            }
        });
        
        $(".shopping-cart").on('click', function(){
			var address = $("#address").val();
			console.log("address: "+address);

			// 폼 생성 및 데이터 전송
			var form = $('<form>').attr({
				method: 'GET',
				action: 'CartFindListByCartNo.do'  // 컨트롤러 URL을 입력해주세요
			});
			
			// 주소 값을 히든 필드로 추가
			$('<input>').attr({
				type: 'hidden',
				name: 'address',
				value: address
			}).appendTo(form);
			  
			// 폼 전송
			form.appendTo('body').submit();
		});
        
        $(".single-category-item").on('click', function(){
			var clickedElement = $(this);
			var address = $("#address").val();
//			var category = $(".single-category-item").data("type");
			var category = clickedElement.data("type");
//			alert(category);
			//alert(address);
			console.log("category: "+category);
			console.log("address: "+address);

			if($("#address").val()==""){
				alert("주소를 선택해주세요");
				return false;
			}
			
			// 폼 생성 및 데이터 전송
			var form = $('<form>').attr({
				method: 'GET',
				action: 'StoFindStoreListAll.do'  // 컨트롤러 URL을 입력해주세요
			});
			  
			// 주소 값을 히든 필드로 추가
			$('<input>').attr({
				type: 'hidden',
				name: 'address',
				value: address
			}).appendTo(form);
			
			$('<input>').attr({
				type: 'hidden',
				name: 'category',
				value: category
			}).appendTo(form);
			
			// 폼 전송
			form.appendTo('body').submit();
		});

        // count down
        if($('.time-countdown').length){  
            $('.time-countdown').each(function() {
            var $this = $(this), finalDate = $(this).data('countdown');
            $this.countdown(finalDate, function(event) {
                var $this = $(this).html(event.strftime('' + '<div class="counter-column"><div class="inner"><span class="count">%D</span>Days</div></div> ' + '<div class="counter-column"><div class="inner"><span class="count">%H</span>Hours</div></div>  ' + '<div class="counter-column"><div class="inner"><span class="count">%M</span>Mins</div></div>  ' + '<div class="counter-column"><div class="inner"><span class="count">%S</span>Secs</div></div>'));
            });
         });
        }
        
        // projects filters isotop
        $(".product-filters li").on('click', function () {
            
            $(".product-filters li").removeClass("active");
            $(this).addClass("active");

            var selector = $(this).attr('data-filter');
//            var chek1 = $("#item").data("chk");
//
//            var chek = $(".product-filters ul li").data("filters");
//            console.log("chek:"+chek);
//            console.log("chek1:"+chek1);
//
//            console.log("selector:"+selector);
//            
//            if(chek!=selector){
//				$(".single-product-item").hide();
//			}else{
//				$(".single-product-item").show();
//			}

            $(".product-lists").isotope({
                filter: selector,
            });
        });
        
        // isotop inner
        $(".product-lists").isotope();

        // magnific popup
        $('.popup-youtube').magnificPopup({
            disableOn: 700,
            type: 'iframe',
            mainClass: 'mfp-fade',
            removalDelay: 160,
            preloader: false,
            fixedContentPos: false
        });

        // light box
        $('.image-popup-vertical-fit').magnificPopup({
            type: 'image',
            closeOnContentClick: true,
            mainClass: 'mfp-img-mobile',
            image: {
                verticalFit: true
            }
        });

        // homepage slides animations
        $(".homepage-slider").on("translate.owl.carousel", function(){
            $(".hero-text-tablecell .subtitle").removeClass("animated fadeInUp").css({'opacity': '0'});
            $(".hero-text-tablecell h1").removeClass("animated fadeInUp").css({'opacity': '0', 'animation-delay' : '0.3s'});
            $(".hero-btns").removeClass("animated fadeInUp").css({'opacity': '0', 'animation-delay' : '0.5s'});
        });

        $(".homepage-slider").on("translated.owl.carousel", function(){
            $(".hero-text-tablecell .subtitle").addClass("animated fadeInUp").css({'opacity': '0'});
            $(".hero-text-tablecell h1").addClass("animated fadeInUp").css({'opacity': '0', 'animation-delay' : '0.3s'});
            $(".hero-btns").addClass("animated fadeInUp").css({'opacity': '0', 'animation-delay' : '0.5s'});
        });

       

        // stikcy js
        $("#sticker").sticky({
            topSpacing: 0
        });

        //mean menu
        $('.main-menu').meanmenu({
            meanMenuContainer: '.mobile-menu',
            meanScreenWidth: "992"
        });
        
         // search form
        $(".search-bar-icon").on("click", function(){
            $(".search-area").addClass("search-active");
        });

        $(".close-btn").on("click", function() {
            $(".search-area").removeClass("search-active");
        });
    
    });


    jQuery(window).on("load",function(){
        jQuery(".loader").fadeOut(1000);
    });


}(jQuery));