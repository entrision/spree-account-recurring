module Spree
  class Recurring < Spree::Base
    include RestrictiveDestroyer

    acts_as_restrictive_destroyer

    has_many :plans
    attr_readonly :type
    validates :type, :name, presence: true
    validates :type, uniqueness: { message: 'of provider recurring already exists' }

    scope :active, -> { undeleted.where(active: true) }

    def self.display_name
      name.gsub(%r{.+:}, '')
    end

    def visible?
      active? && !is_destroyed?
    end

    def default_plan
      plans.default
    end

    def preferred_secret_key
      preferences[:secret_key]
    end

    def preferred_public_key
      preferences[:public_key]
    end

    def has_preferred_keys?
      preferred_secret_key.present? && preferred_public_key.present?
    end
  end
end
