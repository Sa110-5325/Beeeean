//トップへ戻るボタン
$(function() {
  $('#page_top a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 500);//アニメーションの動作時間(100=0.1秒)
    event.preventDefault();
  });
});