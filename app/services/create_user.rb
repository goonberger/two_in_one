class CreateUser

    attr_reader :user_params, :address_params

    def initialize(params)
      @user_params = params.select { |k,_| ["name", "email"].include?(k) }.to_h.symbolize_keys
      @address_params = params.select { |k,_| ["house_number", "street", "city"].include?(k) }.to_h.symbolize_keys
    end

    def call
      user = User.new(@user_params)
      user.address = Address.new(@address_params)
      user.valid?
      user.address.valid?
      user
    end   
end