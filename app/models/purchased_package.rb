class PurchasedPackage < ApplicationRecord
  belongs_to :package
  belongs_to :user
end
