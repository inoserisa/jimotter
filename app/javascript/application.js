// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

document.addEventListener('turbo:load', function() {
  var loader = document.querySelector('.loader-wrap');

  // ページの読み込みが完了したらアニメーションを非表示
  window.addEventListener('load', function() {
    if (loader) {
      loader.style.display = 'none';
    }
  });

  // ページの読み込みが完了してなくても2秒後にアニメーションを非表示にする
  setTimeout(function() {
    if (loader) {
      loader.style.display = 'none';
    }
  }, 1000);
});


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

document.addEventListener('turbo:load', () => {
  // スクロールトップボタンをクリックしたときの処理
  const scrollTopBtn = document.querySelector('.scroll-top-btn');
  if (scrollTopBtn) {
    scrollTopBtn.addEventListener('click', (e) => {
      e.preventDefault();
      window.scrollTo({ top: 0, behavior: 'smooth' }); // ページトップへスクロール
    });
  }

  // ページが100ピクセルまでスクロールされたらボタンを表示
  window.addEventListener('scroll', () => {
    if (window.scrollY > 100) {
      scrollTopBtn.classList.add('show'); // ボタンを表示
    } else {
      scrollTopBtn.classList.remove('show'); // ボタンを非表示
    }
  });
});
