require 'integration_spec_helper'
require_relative '../../../lib/repositories/user_repository'

RSpec.describe UserRepository do
  let(:entity)     { Support.user_one }
  let(:entity_two) { Support.user_two }
  let(:field)      { :username }

  subject (:repository) { UserRepository.new }

  it_behaves_like 'a database repository'
end
