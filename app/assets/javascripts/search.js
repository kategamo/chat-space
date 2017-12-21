$(document).on('turbolinks:load', function() {

var search_list = $("#user-search-result");
var add_list = $(".chat-group-user__name")

function addUser(user) {
  var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${user.userId}'>
                  <p class='chat-group-user__name'>${user.userName}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>　削除</a>
                </div>`;
    add_list.append(html);
    return html;
//appendUserで持って来たdataはすでにHTML型のため、${user.userId}、${user.userName}という形でuseridとnameが取得できる

};

function appendUser(user) {
    var html = `<div class="chat-group-user clearfix">
    　　　　　　　<p class="chat-group-user__name">
               ${user.name}
               </p>
    　　　　　　　<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
    　</div>`;
    search_list.append(html);
    return html;
 };

 function appendNouser(user) {
    var html = `${ user }</div>`
    search_list.append(html);
    return html;
  }

  $("#user-search-field.chat-group-form__input").on("keyup", function() {
    var input = $("#user-search-field.chat-group-form__input").val();

    $.ajax({
      type: 'GET',
      url: '/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else {
        appendNouser("一致するユーザーはおりません");
      }
    })
    .fail(function() {
       alert('ユーザー検索に失敗しました');
    })
  });

$("#user-search-result").on('click','.chat-group-user__btn--add', function(){
      var user= $(this).data();
      addUser(user);
      $(this).parent().remove();
    });
// 元から存在した#user-search-resultにイベントを持たせて、条件は'.chat-group-user__btn--add'がクリックされた時
//$(this)でaタグ丸ごと取得
$("#chat-group-users").on('click','.user-search-remove.chat-group-user__btn.chat-group-user__btn--remove.js-remove-btn', function(){
      $(this).parent().remove();
    });
});
