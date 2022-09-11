class JobOffer
  NO_EXPERIENCE = ''.freeze
  NOT_SPECIFIED = 0
  include ActiveModel::Validations

  attr_accessor :id, :user, :user_id, :title,
                :location, :experience, :description, :is_active,
                :updated_on, :created_on

  VALID_EXPERIENCE_REGEX = /\A^[0-9]+$\z/i.freeze
  validates :title, presence: true
  validates :experience, format: { with: VALID_EXPERIENCE_REGEX, message: 'invalid experience' }

  def initialize(data = {})
    @id = data[:id]
    @title = data[:title]
    @location = data[:location]
    @description = data[:description]
    @is_active = data[:is_active]
    @updated_on = data[:updated_on]
    @created_on = data[:created_on]
    @user_id = data[:user_id]
    @experience = data[:experience].eql?(NO_EXPERIENCE) || data[:experience].nil? ? NOT_SPECIFIED : data[:experience]
    validate!
  end

  def owner
    user
  end

  def owner=(a_user)
    self.user = a_user
  end

  def activate
    self.is_active = true
  end

  def deactivate
    self.is_active = false
  end

  def old_offer?
    (Date.today - updated_on) >= 30
  end
end
