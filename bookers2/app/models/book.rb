class Book < ApplicationRecord
  belongs_to :user
   # belongs_toは、bookモデルからuser_idに関連付けられていて、Userモデルを参照することができる
   # bookモデルに関連付けられるのは、1つのUserモデルのみ → 単数形の「user」になっている
   # アソシエーション

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

end
