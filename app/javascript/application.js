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
          // bellIconSmall.style.color = ''; // 元の色に戻す
        }
        if (bellIconLarge) {
          bellIconLarge.classList.remove('faa-wrench', 'animated');
          //bellIconLarge.style.color = ''; // 元の色に戻す
        }
      }).catch(error => {
        console.error("Fetchリクエストに失敗しました: ", error);
      });
    });
  } else {
    console.log("通知モーダルが見つかりませんでした");
  }
});
