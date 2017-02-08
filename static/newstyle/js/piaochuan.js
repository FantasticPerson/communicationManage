;(function(){
		function FloatWin (){
			return new _FloatWin().init(arguments[0]);
		}

		function _FloatWin(){
			return {
				init : function (opt){
					this.options = opt || {
						floatId : 'floatId',
						posX : 0,
						posY : 0,
						width : 200,
						height : 200,
						step : 3
					};
					this.obj = document.getElementById(this.options.floatId);
					this.render();
				},
				render : function (){
					var options =  this.options;
					var obj = this.obj;
					var settings = {
						'position' : 'absolute',
						'left' : options.posX,
						'top' : options.posY,
						'width' : options.width,
						'height' : options.height
					};
					for (var attr in settings) {
						css(obj, attr, settings[attr]);
					}
					this.bindEvents();
					this.start();
				},
				bindEvents : function (){
					var obj = this.obj;
					var _this_ = this;
					this.floatFlag = 0;

					obj.onmouseover = function (){
						_this_.stop();
					};
					obj.onmouseout = function(){
						_this_.start();
					}
				},
				start : function (){
					var _this_ = this;
					var obj = this.obj;
					var opt = this.options;
					var stepX = opt.stepX,
						stepY = opt.stepY;
					this._timer_ = setInterval(function(){
						var l = css(obj, 'left'),
							t = css(obj, 'top'),
							w = winSize().width,
							h = winSize().height,
							tH = +h - +opt.height,
							tW = +w - +opt.width;

						switch(_this_.floatFlag){
							case 0 : 
								l += stepX;
								t += stepY;
								break;
							case 1 : 
								l += stepX;
								t -= stepY;
								break;
							case 2 : 
								l -= stepX;
								t -= stepY;
								break;
							case 3 :
								l -= stepX;
								t += stepY;
								break;
						}

						css(obj, 'left', l);
						css(obj, 'top', t);

						if(t>= tH || l>= tW || t<=0 || l<=0){
							_this_.floatFlag++;
							_this_.floatFlag %= 4;
						}
					}, opt.freq);
				},
				stop : function (){
					var _this_ = this;
					clearInterval(_this_._timer_);
					_this_._timer_ = null;
				}
			};
		}

		var  css = function(obj, attr, val){
			if (arguments.length == 2) {
				return parseFloat(obj.currentStyle ? obj.currentStyle[attr] : document.defaultView.getComputedStyle(obj, null)[attr]);
			} else {
				switch (attr){
					case 'width':
					case 'height':
					case 'padding-left':
					case 'padding-right':
					case 'padding-bottom':
					case 'padding-top':
						val = Math.max(val, 0);
					case 'left':
					case 'top':
					case 'margin-left':
					case 'margin-right':
					case 'margin-top':
					case 'margin-bottom':
						obj.style[attr] = val + 'px';
						break;
					case 'opacity':
						obj.style.opacity = val;
						obj.style.filter = 'alpha(opacity:'+(val*100)+')';
						break;
					default : 
						obj.style[attr] = val;
				}

				return function (attr_in, attr_val){css(obj, attr_in, attr_val);};
			}
		};

		var winSize = function() {
		    var e = window,
		        a = 'inner';

		    if (!('innerWidth' in window )){
		        a = 'client';
		        e = document.documentElement || document.body;
		    }

		    return { width : e[ a+'Width' ] , height : e[ a+'Height' ] };
		};
		window.FloatWin = FloatWin;
	})();
