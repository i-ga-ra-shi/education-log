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
        @student = Student.new(student_params)

        # エクセルファイルがアップロードされたときの処理
        if params[:student].try(:[], :file)
            student_registration
            redirect_to students_path
            flash[:notice] = "登録が完了しました。"
        # 手動で入力されたときの処理
        elsif @student.save
            redirect_to students_path
            flash[:notice] = "登録が完了しました。"
        else
            render :new
        end
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        if @student.update(student_params)
            flash[:notice] = "更新しました。"
            redirect_to(students_path)
        else
            render :edit
        end
    end

    def destroy
        Student.find(params[:id]).destroy
        flash[:notice] = "削除しました。"
        redirect_to students_path
    end

    private
    def student_params
        params.require(:student).permit(:grade, :class_number, :number, :name).merge(user_id: current_user.id)
    end

    def student_registration
        require 'roo'

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
        rows = sheet.parse(grade: "grade", class_number: "class", number: "number", name: "name")

        # 読み取った情報からデータベースに登録
        rows.each do |row|
            Student.create(grade: row[:grade], class_number: row[:class_number], number: row[:number], name: row[:name], user_id: current_user.id)
        end

        # 一時ファイルの削除
        File.delete(temp_file)
    end
end
