class Post < ApplicationRecord
  before_save :geocode

  belongs_to :user
  belongs_to :prefecture
  belongs_to :city
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_one :notification, as: :subject, dependent: :destroy

  validates :content, presence: true, length: { maximum: 200 }

  def self.ransackable_attributes(auth_object = nil)
    ["prefecture", "city", "prefecture_id", "city_id"]
  end

  private

  def geocode
    prefecture_name = self.prefecture.name
    city_name = self.city.name

    address = "#{city_name}, #{prefecture_name}, Japan"
    
    response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json', {params: {address: address, key: ENV['GEOCODE_API_KEY']}}
    if response.code == 200
      data = JSON.parse(response.body)
      Rails.logger.debug "Geocode response: #{data}" # レスポンスのログ出力
      if data['status'] == 'OK' && data['results'].any?
        self.latitude = data['results'][0]['geometry']['location']['lat']
        self.longitude = data['results'][0]['geometry']['location']['lng']
      else
        Rails.logger.error "Geocode failed for address: #{address}"
      end
    else
      Rails.logger.error "Geocode request failed with code: #{response.code}"
    end
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error "Geocode request failed: #{e.response}"
  end
end
