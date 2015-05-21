class DatabaseRepository
  def all
    entity_class.all.to_a
  end

  def create(entity)
    entity.save!
    entity
  end

  def update(entity)
    entity.save!
    entity
  end

  def find(id)
    entity_class.find(id) rescue nil
  end

  def find_by(options = {})
    entity_class.find_by(options) rescue nil
  end

  def delete(entity)
    entity.destroy!
  end

  protected
  def entity_class
    raise NotImplementedError
  end
end
