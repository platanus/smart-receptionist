class User < ApplicationRecord
end

# == Schema Information
#
# Table name: users
#
#  id           :bigint(8)        not null, primary key
#  slack_id     :string
#  is_admin     :boolean
#  is_bot       :boolean
#  name         :string
#  email        :string
#  image_72     :string
#  real_name    :string
#  display_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted      :boolean          default(FALSE)
#
