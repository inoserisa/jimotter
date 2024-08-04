crumb :root do
  link raw("<i class='fa-solid fa-house-chimney home-icon'></i>"), root_path
end

crumb :user_new do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :user_show do |user|
  link "#{user.name}さんのマイページ", user_path(user)
  parent :root
end

crumb :user_signin do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :password_forgot do |user|
  link "パスワード再設定", new_password_path(user)
  parent :user_signin
end

crumb :cancel_menbership do
  link "退会", cancel_membership_path
  parent :root
end

crumb :about do
  link "サイトについて", about_path
  parent :root
end

crumb :terms do
  link "利用規約", terms_path
  parent :root
end

crumb :privacy_policy do
  link "プライバシーポリシー", privacy_policy_path
  parent :root
end

crumb :post_new do
  link "新規投稿", new_post_path
  parent :root
end

crumb :post_show do |post|
  link "#{post.prefecture.name} #{post.city.name}の投稿", post_path(post)
  parent :root
end

crumb :question_show do |question|
  link "#{question.user.name}さんの質問", question_path(question)
  parent :root
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).