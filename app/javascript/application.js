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

introJs().setOptions({
  steps: [{
    intro: "Jimotterへようこそ！アプリの説明を開始します。"
  }, {
    element: document.querySelector('#login'),
    intro: "ログインすると投稿・ブックマークなどができます。"
  },{
    element: document.querySelector('#search'),
    intro: "地域を指定して検索が可能です。都道府県のみでも検索できます。"
  }]
}).start();

document.addEventListener('turbo:load', function() {
  if (!document.cookie.includes('tutorial_shown=true')) {
    startTour();
  }

  document.getElementById('start-tour').addEventListener('click', startTour);

  introJs().oncomplete(function() {
    document.cookie = 'tutorial_shown=true; path=/';
  });
});