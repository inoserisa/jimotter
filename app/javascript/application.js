// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

document.addEventListener("turbo:load", () => {
  const notificationsModal = document.getElementById('notificationsModal');
  if (notificationsModal) {
    notificationsModal.addEventListener('show.bs.modal', () => {

      fetch('/notifications/mark_as_read', {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
      }).then(() => {
        const bellIconSmall = document.getElementById('notification-icon-small');
        const bellIconLarge = document.getElementById('notification-icon-large');
        
        if (bellIconSmall) {
          bellIconSmall.classList.remove('faa-wrench', 'animated');
          bellIconSmall.style.color = ''; // 元の色に戻す
        }
        if (bellIconLarge) {
          bellIconLarge.classList.remove('faa-wrench', 'animated');
          bellIconLarge.style.color = ''; // 元の色に戻す
        }
      }).catch(error => {
        console.error("Fetchリクエストに失敗しました: ", error);
      });
    });
  } else {
    console.log("通知モーダルが見つかりませんでした");
  }
});

document.addEventListener('turbo:load', function() {
  initializeTooltips();
});

document.addEventListener('turbo:before-stream-render', function() {
  hideTooltips();
});

function initializeTooltips() {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });
}

function hideTooltips() {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    var tooltip = bootstrap.Tooltip.getInstance(tooltipTriggerEl);
    if (tooltip) {
      tooltip.hide();
    }
  });
}

document.addEventListener('DOMContentLoaded', function() {
  initializeTooltips();
});

document.addEventListener('turbo:load', function() {
  initializeTooltips();
});

document.addEventListener('turbo:frame-load', function() {
  initializeTooltips();
});

function startTour() {
  introJs().setOptions({
    steps: [{
      intro: "Jimotterへようこそ！アプリの説明を開始します。"
    }, {
      element: document.querySelector('#login'),
      intro: "ログインすると投稿・ブックマークなどができます。"
    },{
      element: document.querySelector('#search'),
      intro: "地域を指定して検索が可能です。都道府県のみでも検索できます。"
    },{
      element: document.querySelector('#map'),
      intro: "投稿地域がどこにあるのか地図を見ることができます。また、コメントの投稿もできます。"
    }]
  }).start().oncomplete(function() {
    document.cookie = 'tutorial_shown=true; path=/; max-age=' + 60*60*24*365; // Cookieの有効期限を1年に設定
  });
}

document.addEventListener('DOMContentLoaded', function() {
  function getCookie(name) {
    let matches = document.cookie.match(new RegExp(
      "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
  }

  if (!getCookie('tutorial_shown')) {
    startTour();
  }

  const startTourButton = document.getElementById('start-tour');
  if (startTourButton) {
    startTourButton.addEventListener('click', startTour);
  }
});
