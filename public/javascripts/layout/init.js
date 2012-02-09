/**
 * @author naqiangzhang
 */
dopage("cinemaWaepper","/cinema/list");
	
	new Ajax.Request("/type/list_all_type",{
		method:'get',
		asynchronous:true,
		onComplete:function(obj){
			$('typeWaepper').innerHTML=obj.responseText;
		}
	});
	
	function check_login(){
		new Ajax.Request("/umeadmin/check_login_state", {
			method: 'get',
			asynchronous: true,
			onComplete:function(obj){
				var state=obj.responseText;
				if (state == "false") {
					alert("你半天都没的反应，不理你了....")
					window.location.href = "/type";
				}
			}
		});
	}
	setInterval(check_login,300000);

	function show(){
		a=$('typeWaepper').style.display;
		if(a=="none"){
			a="block";
		}else{
			a="none";
		}
	}
	
	/*
	 * 菜单收展
	 */
	function mune(e){
		var n=e.childNodes;
		for(var i=0;i<n.length;n++){
			n[i].className="none";
		}
	}
	