/**
 * @author naqiangzhang
 */
function view(num,e){
	new Ajax.Request("/front/list/"+num,{
		method:'get',
		asynchronous:true,
		onComplete:function(obj){
			$('bod').innerHTML=obj.responseText;
		}
	});
	var p=e.parentNode.parentNode.childNodes;
	for(var i=0;i<p.length;i++){
		p.item(i).className="off";
	}
	e.parentNode.className="on";
	}

function change(type){
	if(type=='jryx'){
		$('today').style.display="block";
		$('tomorow').style.display="none";
		$('tod').src="/images/index/yinxun_tod_on.jpg";
		$('tom').src="/images/index/yinxun_tom_off.jpg";
	}else if(type=='mryx'){
                $('today').style.display="none";
		$('tomorow').style.display="block";
		$('tod').src="/images/index/yinxun_tod_off.jpg";
		$('tom').src="/images/index/yinxun_tom_on.jpg";
	}
}

/**
 * 初始化页面
 */
function init(){
	new Ajax.Request("/front/list/2",{
		method:'get',
		asynchronous:true,
		onComplete:function(obj){
			$('bod').innerHTML=obj.responseText;
		}
	});
	var i;
	if(!-[1,])
		i=0;		
	else
		i=1;
	document.getElementById("cinema_list").childNodes[i].childNodes[i].className="on";
}

init();