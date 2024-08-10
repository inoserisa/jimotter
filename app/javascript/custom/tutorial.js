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
  }

  introJs.tour().setOptions({
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