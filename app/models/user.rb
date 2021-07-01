class User < ApplicationRecord
    # This macro notifies bcyrpt that there's a password it should encrypt
    has_secure_password
end
