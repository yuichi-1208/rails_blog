class Blog < ApplicationRecord
  validates :title, presence: true
  validates :title, length: {maximum: 140}
  validates :content, presence: true
  validates :content, length: {maximum:140}
end
