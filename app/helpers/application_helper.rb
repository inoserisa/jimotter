module ApplicationHelper
  def default_meta_tags
    {
      site: 'jimotter.com',
      title: 'Jimotter-地域あるある投稿アプリ-',
      description: 'あなたの地元のあるあるやエピソードを市区町村単位で共有しよう',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: asset_url('sharecard.png'),
        local: 'ja-JP'
      },

      twitter: {
        card: 'summary_large_image',
        site: '@inoserisa',
        image: asset_url('sharecard.png')
      }
    }
  end
end
