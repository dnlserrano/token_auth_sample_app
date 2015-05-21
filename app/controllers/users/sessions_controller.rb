class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      resource.token = SecureRandom.hex(32)
      resource.save
    end
  end
end
