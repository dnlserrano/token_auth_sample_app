require_relative 'database_repository'

class UserRepository < DatabaseRepository
  def entity_class
    User
  end
end
