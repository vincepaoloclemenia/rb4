class PasswordVerifier
    attr_accessor :admin, :password_params
    def initialize(admin, password_params)
        @admin = admin
        @password_params = password_params
    end

    def valid?
        admin.password_hash == generated_hash
    end

    private

        def generated_hash
            digest = OpenSSL::Digest::SHA256.new
            digest.update(password_params)
            digest.update(admin.salt)
            digest.to_s
        end
end