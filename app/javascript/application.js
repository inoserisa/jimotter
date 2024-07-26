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
  const isLoggedIn = document.body.dataset.loggedIn === 'true';

  const steps = [{
    intro: "Jimotterへようこそ！アプリの説明を開始します。"
  }];

  if (isLoggedIn) {
    // ログインしている場合のステップ
    steps.push({
      element: document.querySelector('#post-button'),
      intro: "ここから投稿できます。"
    },{
      element: document.querySelector('#search'),
      intro: "地域を指定して検索が可能です。都道府県のみでも検索できます。"
    },{
      element: document.querySelector('#map'),
      intro: "投稿地域がどこにあるのか地図を見ることができます。また、コメントの投稿もできます。"
    },{
      element: document.querySelector('a[data-bs-toggle="tab"]'), // 最初のタブボタンを指定
      intro: "タブを切り替えて質問一覧を表示できます。",
      position: 'bottom' // ハイライトの位置を指定
    });
  } else {
    // ログインしていない場合のステップ
    steps.push({
      element: document.querySelector('#login'),
      intro: "ログインすると投稿・ブックマークなどができます。"
    },{
      element: document.querySelector('#map'),
      intro: "投稿地域がどこにあるのか地図を見ることができます。また、コメントの投稿もできます。"
    },{
      element: document.querySelector('a[data-bs-toggle="tab"]'), // 最初のタブボタンを指定
      intro: "タブを切り替えて質問一覧を表示できます。",
      position: 'bottom' // ハイライトの位置を指定
    });
  }

  introJs().setOptions({
    steps: steps,
    doneLabel: '完了',
    nextLabel: '次へ',
    prevLabel: '前へ',
    exitOnEsc: true,
    exitOnOverlayClick: false,
    showProgress: true,
    showBullets: true
  }).start();
}

document.addEventListener('turbo:load', function() {
  const startTourButtonSm = document.getElementById('start-tour-sm');
  if (startTourButtonSm) {
    startTourButtonSm.addEventListener('click', function() {
      startTour();
    });
  }

  const startTourButtonLg = document.getElementById('start-tour-lg');
  if (startTourButtonLg) {
    startTourButtonLg.addEventListener('click', function() {
      startTour();
    });
  }
});