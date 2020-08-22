class List < ApplicationRecord
  # relations
  belongs_to :occupation
  
  # extensoes
  include PgSearch
  extend FriendlyId

  # defaults
  after_save :create_notify
  after_destroy :destroy_nofity

  friendly_id :name, use: :slugged
  pg_search_scope :search,
   against: %i[name occupation_id],
   associated_against: { occupation: %i[description]}

  # validations
  validates :name, :email, :occupation_id, :salario, presence: true
  validate :email, if: -> { email_is_valid? }

  def create_notify
    notify_slack("🎉 Novo funcionário: #{name} 🎉")
  end

  def destroy_nofity
    # use username or email, see in config/initializer/slack_notiifer.rb
    notify_slack("❌ Funcionário @#{name} removido")
  end

  def notify_slack(msg)
    SlackNotifier::CLIENT.ping msg
  end

  def email_is_valid?
    #la no controller retorna a mensagem em mensagem para o frontend
    #usando algum notify
    if (email =~ URI::MailTo::EMAIL_REGEXP).nil?
      errors.add('Email inválido !')
    end
  end
end
