RSpec.shared_examples 'a database repository' do

  describe '#all' do
    it 'returns all entities in the repository' do
      repository.create(entity)
      repository.create(entity_two)

      users = repository.all

      expect(users.length).to eq 2
      expect(users.first).to  eq entity
      expect(users.second).to eq entity_two
    end
  end

  describe '#find' do
    it 'finds the entity for a given id' do
      repository.create(entity)

      user = repository.find(entity.id)

      expect(user).to eq entity
    end

    context 'when there is no entity for the given id' do
      it 'returns nil' do
        user = repository.find(1)

        expect(user).to be_nil
      end
    end
  end

  describe '#find_by' do
    before(:each) do
      repository.create(entity)
    end

    it 'finds the entity by a given field' do
      user = repository.find_by(field => entity.send(field))

      expect(user).to eq entity
    end

    context 'when there is no entity for the given id' do
      it 'returns nil' do
        user = repository.find_by(field => entity_two.send(field))

        expect(user).to be_nil
      end
    end
  end

  describe '#create' do
    it 'creates the given entity' do
      user = repository.create(entity)

      expect(user).to eq entity
    end

    context 'when saving the entity fails' do
      it 'raises an error' do
        expect(entity).to receive(:save!).and_raise('Error')

        expect { repository.create(entity) }.to raise_error('Error')
      end
    end
  end

  describe '#update' do
    it 'updates the given entity' do
      repository.create(entity)

      entity.send("#{field.to_s}=", entity_two.send(field))
      repository.update(entity)

      user = repository.find(entity.id)
      expect(user.send("#{field}")).to eq entity_two.send(field)
    end

    context 'when saving the entity fails' do
      it 'raises an error' do
        expect(entity).to receive(:save!).and_raise('Error')

        expect { repository.update(entity) }.to raise_error('Error')
      end
    end
  end

  describe '#delete' do
    it 'deletes the given entity' do
      repository.create(entity)

      repository.delete(entity)

      users = repository.all
      expect(users).to be_empty
    end

    context 'when destroying the entity fails' do
      it 'raises an error' do
        expect(entity).to receive(:destroy!).and_raise('Error')

        expect { repository.delete(entity) }.to raise_error('Error')
      end
    end
  end

end
