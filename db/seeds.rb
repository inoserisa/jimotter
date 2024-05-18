# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# CSVファイルを使用することを明示
require 'csv'

# 使用するデータ（CSVファイルの列）を指定
CSVROW_PREFNAME = 6
CSVROW_CITYNAME = 7

# CSVファイルを読み込み、DB（テーブル）へ保存
CSV.foreach('db/CSV/prefecture.CSV') do |row|
  prefecture_name = row[CSVROW_PREFNAME]
  city_name = row[CSVROW_CITYNAME]
  prefecture = Prefecture.find_or_create_by(name: prefecture_name)
  City.find_or_create_by(name: city_name, prefecture_id: prefecture.id)
end
