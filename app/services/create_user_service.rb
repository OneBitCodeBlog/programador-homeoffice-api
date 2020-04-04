class CreateUserService

  def initialize(session:, name:)
    @session = session
    @name = name
  end

  def call
    User.create!(
      name: @name,
      session_id: @session
    )
  end
end