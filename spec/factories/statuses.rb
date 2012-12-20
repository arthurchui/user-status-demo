FactoryGirl.define do
  factory :status do
    user
    created_at Time.now
    updated_at Time.now

    factory :active_status do
      message "I'm office"
      active true
    end

    factory :inactive_status do
      message "I'm off"
      active false
    end
  end
end