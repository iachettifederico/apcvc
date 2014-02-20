$(document).ready( function(){
  $('.about-tramas .tramas-article').hide();
  $('.about-tramas .info2').hide();
  $('.about-tramas').click( function(){
      $('.about-tramas .tramas-article').toggle(500);
    $('.about-tramas .info1').toggle(0);
    $('.about-tramas .info2').toggle(0);
  });
});
