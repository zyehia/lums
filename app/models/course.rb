class Course < ApplicationRecord
  belongs_to :user
  has_many :enrollments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :lectures, -> { order(position: :asc) }, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true
  validates :user, presence: true

  def student_count
    self.enrollments.count
  end
end
