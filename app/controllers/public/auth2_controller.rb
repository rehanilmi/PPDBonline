class Public::Auth2Controller < ApplicationController


      protect_from_forgery except: [:daftar_post, :masuk_post]

      def daftar
      end

      def daftar_post
        @email            = params[:orang_email].delete(' ').downcase
        @password         = params[:orang_password]
        @password_confirm = params[:password_confirm]
        @pass             = BCrypt::Password.create(@password)

        @hasil_akhir = ''

        if @password == @password_confirm

          if @password.length >= 8

            if Orang.where(orang_email: @email).count == 0

              @ora                    = Orang.new
              @ora.orang_email         = @email
              @ora.orang_password      = @pass
              # @ora.orang_status        = 'inactive'
              @ora.save

              flash[:notif] = 'Terimakasih telah mendaftar'

              redirect_to controller: '/public/auth2/auth2', action: 'masuk'

            else
              flash[:notif] = 'Email sudah terdaftar. Silahkan login'

              redirect_to controller: '/public/auth2', action: 'masuk'
            end
          else
            flash[:notif] = 'Password at least 8 char'

            render 'daftar'

          end
        else

          flash[:notif] = 'Confirmation is not match'

          render 'daftar'
        end


      end

      def masuk
      end

      def masuk_post
        @email = params[:orang_email]
        @password = params[:orang_password]

        @peserta = Orang.find_by(orang_email: @email)

        if @peserta.blank? # hasilnya false atau true
          flash[:notif] = 'Unregistered email'
          redirect_to action: "masuk"
        else

          @orang = @peserta

          if @peserta.valid_password?(@password)
            # if @orang.orang_status == ''
               session[:orang_id]    = @orang.id
               session[:orang_email] = @orang.orang_email
               session[:orang_tf]   = true
            #   #TheMailMailer.login_notification(@orang.oadm_email).deliver_later

              redirect_to controller: "/public/public", action: "guru"

            # else
            #   flash[:notif] = 'peserta ditolak'
            #
            #   redirect_to action: "masuk"
            # end
          else
            # redirect_to action: 'signin', info: 'Email dan password tidak match', email: @email
            flash[:notif] = 'Email dan password tidak match'
            redirect_to action: "masuk"
          end
        end
      end

end
