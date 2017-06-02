require 'rails_helper'

RSpec.describe '/lists' do
  describe 'GET /lists' do
    it 'returns all lists' do
      FactoryGirl.create_list(:list, 2, name: 'My To-Do List')

      get '/lists.json'

      expect(response).to be_success

      response_body = JSON.parse(response.body)
      expect(response_body).to match_json_expression(
        [
          {
            id: 1,
            name: 'My To-Do List'
          }.ignore_extra_keys
        ].ignore_extra_values
      )

      expect(response_body.length).to eq 2
    end
  end

  describe 'GET /list/:id' do
    it 'returns the list' do
      list = FactoryGirl.create(:list, name: 'My To-Do List')

      get "/lists/#{list.id}.json"

      expect(response).to be_success

      expect(response_body).to match_json_expression(
        {
          id: list.id,
          name: 'My To-Do List'
        }.ignore_extra_keys
      )
    end

    it 'includes the list items' do
      list = FactoryGirl.create(:list, name: 'My To-Do List')
      FactoryGirl.create(:item, list: list, name: 'Buy thing 1')
      FactoryGirl.create(:item, list: list, name: 'Buy thing 2', done: true)

      get "/lists/#{list.id}.json"

      expect(response_body).to match_json_expression(
        {
          items: [
            {
              name: 'Buy thing 1',
              done: false
            }.ignore_extra_keys,
            {
              name: 'Buy thing 2',
              done: true
            }.ignore_extra_keys
          ]
        }.ignore_extra_keys
      )
    end
  end
end
