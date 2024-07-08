// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

document.addEventListener("turbo:load", () => {
  console.log("JavaScriptが正しく読み込まれました（Turbolinks対応）");

  const notificationsModal = document.getElementById('notificationsModal');
  if (notificationsModal) {
    notificationsModal.addEventListener('show.bs.modal', () => {
      console.log("通知モーダルが開かれました");

      fetch('/notifications/mark_as_read', {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
      }).then(() => {
        const bellIcon = document.getElementById('notification-icon');
        if (bellIcon) {
          console.log("通知アイコンの見た目を変更します");
          bellIcon.classList.remove('faa-wrench', 'animated');
          bellIcon.style.color = ''; // 元の色に戻す
        } else {
          console.log("通知アイコンが見つかりませんでした");
        }
      }).catch(error => {
        console.error("Fetchリクエストに失敗しました: ", error);
      });
    });
  } else {
    console.log("通知モーダルが見つかりませんでした");
  }
});