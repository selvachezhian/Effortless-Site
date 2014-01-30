class Site < ActiveRecord::Base

  # Relationships
  has_many :menus
  has_many :pages

  belongs_to :site_status
  belongs_to :logo
  belongs_to :banner
  belongs_to :html_template
  belongs_to :theme
  belongs_to :user

  # Validations
  validates :name, :domain, presence: true, length: { maximum: 200 }
  validates :domain, uniqueness: true

  before_save do |site|
    site.site_status = SiteStatus.find_by_name('Offline') if site.site_status.blank?
  end

end
