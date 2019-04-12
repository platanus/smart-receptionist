# == Schema Information
#
# Table name: users
#
#  id           :bigint(8)        not null, primary key
#  slack_id     :string
#  is_admin     :string
#  is_bot       :string
#  name         :string
#  last_name    :string
#  email        :string
#  image_42     :string
#  real_name    :string
#  display_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
