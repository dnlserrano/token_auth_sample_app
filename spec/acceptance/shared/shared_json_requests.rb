RSpec.shared_context 'json headers' do
  let(:headers)  {
    {
      'Content-Type' => 'application/json',
      'Accept'       => 'application/json'
    }
  }
end
