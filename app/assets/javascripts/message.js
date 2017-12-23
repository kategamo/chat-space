$(document).on('turbolinks:load', function() {
function buildHTML(message){
    var image_present = message.image? `<img src=
                    ${message.image.url}>` : "";
    var html = ` <div class ="right__chat__chatsample1">
                    <div class="right__chat__chatsample1__user">
                      ${message.user_name}
                      ${message.created_at}
                    </div>
                    <div class="right__chat__chatsample1__message">
                      ${message.body}
                      ${image_present}
                    </div>
                </div>`;
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this)
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
  })
   .done(function(data){
    $('.button_type2').prop("disabled", false);
    var html = buildHTML(data);
    $('.right__chat').append(html);
    $('.bodybox').val('');
    $('#message_image').val('');
    $('.right__chat').animate({scrollTop: $('.right__chat')[0].scrollHeight}, 'fast');
    // $('html, body').animate({ scrollTop:$('.right__chat')[0].scrollheight}.offset().top});トップまで戻る
  })
  .fail(function(data){
    alert('error');
    });
   return false
  })

  setInterval(function() {
    var url = $(location).attr('pathname')
    $.ajax({
      url:url,
      type: "GET",
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data);
      var id = $('.right__chat__chatsample1').last().data('message-id')
      data.messages.forEach(function(data){
      if(data.id > id){
        html += buildHTML
      }
    });
    $('.right__chat').animate({scrollTop: $('.right__chat')[0].scrollHeight}, 'fast');
    })
    .fail(function(data){
    alert('error');
    });
   } , 5000 );

});
