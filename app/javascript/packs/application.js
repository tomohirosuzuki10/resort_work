// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import ('jquery')

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(function(){
	$(window).on('load scroll',function (){
		$('.js-fade').each(function(){
			//ターゲットの位置を取得
			var target = $(this).offset().top;
			//スクロール量を取得
			var scroll = $(window).scrollTop();
			//ウィンドウの高さを取得
			var height = $(window).height();
			//ターゲットまでスクロールするとフェードインする
			if (scroll > target - height){
				//クラスを付与
				$(this).addClass('scroll');
			}
		});
	});
});

$(function(){
	// 設定
	var interval =4000; // 切り替わりの間隔（ミリ秒）
	var fade_speed = 2000;// フェード処理の早さ（ミリ秒）
	$(".top-concept-all img").hide();
	$(".top-concept-all img:first").addClass("active").show();
	
	var changeImage = function(){
			var $active = $(".top-concept-all img.active");
			var $next = $active.next("img").length?$active.next("img"):$(".top-concept-all img:first");
		 
			$active.fadeOut(fade_speed).removeClass("active");
			$next.fadeIn(fade_speed).addClass("active");
	
					}
	
	setInterval(changeImage,interval);
	
	}());

	$(function(){
		// 設定
		var interval =4000; // 切り替わりの間隔（ミリ秒）
		var fade_speed = 2000;// フェード処理の早さ（ミリ秒）
		$(".top-conept-img2 img").hide();
		$(".top-conept-img2 img:first").addClass("active").show();
		
		var changeImage = function(){
				var $active = $(".top-conept-img2 img.active");
				var $next = $active.next("img").length?$active.next("img"):$(".top-conept-img2 img:first");
			 
				$active.fadeOut(fade_speed).removeClass("active");
				$next.fadeIn(fade_speed).addClass("active");
		
						}
		
		setInterval(changeImage,interval);
		
		}());
		$('.nav_toggle').on('click', function () {
			$('.nav_toggle, .nav-sp').toggleClass('show');
		});
		