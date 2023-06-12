require 'roo'

class StudentsController < ApplicationController
    
    def certificate

    end
    
    def index
        @students = Student.where(user_id: current_user.id)
    end

    def new
        @student = Student.new()
    end

    def create
        if params[:student]
            student_registration
            redirect_to new_student_path
        else
            render :new
        end
    end

    private
    def student_registration
        # ファイルのパスを取得
        file = params[:student][:file]
        temp_file = file.tempfile.path

        if File.extname(file.original_filename) != '.xlsx'
            flash[:error] = 'アップロードされたファイルは.xlsx形式である必要があります'
            redirect_to new_student_path and return
        end

        # エクセルファイルの読み取り
        excel = Roo::Excelx.new(temp_file)
        begin
            sheet = excel.sheet('sheet1')
        rescue Roo::NoSuchSheet
            flash[:error] = '「sheet1」という名前のシートが見つかりません'
            redirect_to new_student_path and return
        end
        rows = sheet.parse(name: "name")

        # 読み取った情報からデータベースに登録
        rows.each do |row|
            Student.create(name: row[:name], user_id: current_user.id)
        end

        # 一時ファイルの削除
        File.delete(temp_file)
    end
end
