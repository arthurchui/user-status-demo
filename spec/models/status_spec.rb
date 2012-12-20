require 'spec_helper'

describe Status do

  before(:each) { create :active_status }

  it { should belong_to :user }

  it { should validate_presence_of :message }

  it { should validate_uniqueness_of :user_id }

end
