class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: { minimum: 2, message: "is too short (minimum is 2 characters)" }
  
  #ActiveStroageの適用　userのプロフィール画像
  has_one_attached :profile_image
  
  has_many :books, dependent: :destroy
  
def get_profile_image(width, height)
  # unless~endまではprofile_imageが投稿されていない場合の記述
  unless profile_image.attached?
    # 以下をfile_pathに指定
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    # file_pathにしてしたものをopen、当該fileのname、Content-Typeを記載
    profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end

end
