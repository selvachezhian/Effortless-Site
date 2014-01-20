class User < ActiveRecord::Base

  # Relationships
  has_many :sites

  belongs_to :role

  # Validations
  validates :first_name, :last_name, uniqueness: true, length: { maximum: 100 }
  validates :email, presence: true, email: true, length: { maximum: 200 }, uniqueness: true
  validates :password, presence: true

  # call_backs
  before_save { self.full_name = (self.first_name + ' ' + self.last_name).strip }

  def password=(pass)
    super(Digest::MD5.hexdigest(pass)) if pass
  end

  def is_admin?
    self.role.try(:name).eql?('Admin')
  end

end
