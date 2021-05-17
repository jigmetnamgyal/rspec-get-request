class GamingConsole < ApplicationRecord
  validates :name, presence: true
  validates :manufacturer, presence: true

  scope :nintendo, -> {where(:manufacturer => 'Nintendo')}
  def formatted_name
    "#{name} #{manufacturer}"
  end

end
