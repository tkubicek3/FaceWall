# Migrate
class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      authenticatable(t)

      recoverable(t)

      ## Rememberable
      t.datetime :remember_created_at

      trackable(t)
      confirmable(t)
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end

  def authenticatable(t)
    t.string :email, null: false, default: ''
    t.string :encrypted_password, null: false, default: ''
  end

  def recoverable(t)
    t.string :reset_password_token
    t.datetime :reset_password_sent_at
  end

  def trackable(t)
    t.integer :sign_in_count, default: 0, null: false
    t.datetime :current_sign_in_at
    t.datetime :last_sign_in_at
    t.inet :current_sign_in_ip
    t.inet :last_sign_in_ip
  end

  def confirmable(t)
    t.string :confirmation_token
    t.datetime :confirmed_at
    t.datetime :confirmation_sent_at
    t.string :unconfirmed_email # Only if using reconfirmable

    t.string :unconfirmed_email # Only if using reconfirmable

    t.timestamps null: false
  end
end
