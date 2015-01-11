class Server < ActiveRecord::Base
  validates :name, presence: true
  validates :provider, presence: true
  validates :resource_type, presence: true

  def update_status(msg)
    self.update_attribute(:status, msg)
  end
end
