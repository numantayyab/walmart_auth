require 'rails_helper'
describe "post a question route", :type => :request do

it 'returns the question' do
    #expect(JSON.parse(response.body)['question']).to eq('test_question')
  end
it 'returns the question\'s answer' do
    #expect(JSON.parse(response.body)['answer']).to eq('test_answer')
  end
it 'returns the question\'s service' do
    #expect(JSON.parse(response.body)['service']).to eq('test_service')
  end
it 'returns the question\'s letter' do
    #expect(JSON.parse(response.body)['letter']).to eq('a')
  end
it 'returns the question\'s number' do
    #expect(JSON.parse(response.body)['number']).to eq(2)
  end
it 'returns a created status' do
    #expect(response).to have_http_status(:created)
  end
end