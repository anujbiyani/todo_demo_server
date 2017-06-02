require 'rails_helper'

RSpec.describe List do
  it { is_expected.to have_many(:items).dependent(:destroy) }
end
