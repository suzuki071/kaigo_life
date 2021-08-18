// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function check() {

  // textareaの情報を取得
  let textValue = document.form.comment.value;

  // 「＼n」で区切り、配列として文字を取り出し,取り出した文字ごとの後ろに<br>タグを付け加える。
  textValue = textValue.split("\n").join("<br>");

  // divタグの要素にtextareaの情報を付与
  const test = document.querySelector('.test');
  test.innerHTML = textValue;
};
