# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  code        :string(32)
#  description :string
#  name        :string(64)       default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
