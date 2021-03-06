class UserRepresenter
    def initialize(user)
      @user = user
    end
  
    def as_json
      {
        id: user.id,
        username: user.username,
        token: AuthenticationTokenService.call(user.id)
        #password: item.password
      }
    end
  
    private
  
    attr_reader :user
  end
  