$(function(){
  var $modal = $('#modal'),
      $modal_close = $modal.find('.close'),
      $modal_container = $('#modal-container');


  $('a[data-remote]').live('ajax:beforeSend', function(e, xhr, settings){
    xhr.setRequestHeader('accept', '*/*;q=0.5, text/html, ' + settings.accepts.html);
  });

  $('a[data-remote]').live('ajax:success', function(xhr, data, status){
    $modal
      .html(data)
      .prepend($modal_close)
      .css('top', $(window).scrollTop() + 40)
      .show();
    $modal_container.show();
  });

  $('.close', '#modal').live('click', function(){
    $modal_container.hide();
    $modal.hide();
    return false;
  });
});