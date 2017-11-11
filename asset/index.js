define([],function(){
    //TODO: 点击操作按钮后如何办？
    return {
        init:function($mod){
        	var $op=$('.J_operation',$mod),
        	$mask=$op.parent().on('click',function(){
        		$mask.removeClass('show')
        	})
        	$mod.on('click','.bt-op',function(e){
        		//alert(e.touches)
        		//console.log(e.originalEvent)
        		$op.css('top',e.clientY||e.touches[0].clientY)
        		$mask.addClass('show');
        	})
        }
    }
})
