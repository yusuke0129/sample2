# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SampleApis', type: :request do
  # sample spec
  describe 'GET /contacts' do
    before do
      create_list(:contact, 10)
      get contacts_path
    end
    context 'when query has not params' do
      subject { JSON.parse(response.body)['data'].size }
      it 'return all contacts' do
        is_expected. to eq 10
      end
    end
  end
end
