require 'active_record'
require 'sqlite3'

require_relative 'college'
require_relative 'faculty'
require_relative 'major'
require_relative 'semester'
require_relative 'course'
require_relative 'lecturer'
require_relative 'student'
require_relative 'college_faculty'
require_relative 'college_faculty_major'
require_relative 'college_lecturer'
require_relative 'lecturer_course'
require_relative 'college_faculty_major_course'
require_relative 'student_course'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "campus.db"
)

ActiveRecord::Schema.define do
  create_table :colleges do |table|
    table.column :name, :string
  end unless ActiveRecord::Base.connection.table_exists?('colleges')

  create_table :faculties do |table|
    table.column :name, :string
  end unless ActiveRecord::Base.connection.table_exists?('faculties')

  create_table :majors do |table|
    table.column :name, :string
  end unless ActiveRecord::Base.connection.table_exists?('majors')

  create_table :semesters do |table|
    table.column :name, :string
  end unless ActiveRecord::Base.connection.table_exists?('semesters')

  create_table :courses do |table|
    table.column :name, :string
  end unless ActiveRecord::Base.connection.table_exists?('courses')

  create_table :lecturers do |table|
    table.column :name, :string
  end unless ActiveRecord::Base.connection.table_exists?('lecturers')

  create_table :students do |table|
    table.column :name, :string
    table.column :college_faculty_major_id, :integer
  end unless ActiveRecord::Base.connection.table_exists?('students')

  create_table :college_faculties do |table|
    table.column :college_id, :integer
    table.column :faculty_id, :integer
  end unless ActiveRecord::Base.connection.table_exists?('college_faculties')

  create_table :college_faculty_majors do |table|
    table.column :college_faculty_id, :integer
    table.column :major_id,           :integer
  end unless ActiveRecord::Base.connection.table_exists?('college_faculty_majors')

  create_table :college_lecturers do |table|
    table.column :lecturer_id,  :integer
    table.column :college_id,   :integer
  end unless ActiveRecord::Base.connection.table_exists?('college_lecturers')

  create_table :lecturer_courses do |table|
    table.column :lecturer_id,  :integer
    table.column :course_id,    :integer
  end unless ActiveRecord::Base.connection.table_exists?('lecturer_courses')

  create_table :college_faculty_major_courses do |table|
    table.column :college_faculty_major_id,   :integer
    table.column :course_id,                  :integer
    table.column :semester_id,                     :integer
    table.column :credit,                     :integer
  end unless ActiveRecord::Base.connection.table_exists?('college_faculty_major_courses')

  create_table :student_courses do |table|
    table.column :student_id,                       :integer
    table.column :college_faculty_major_course_id,  :integer
    table.column :poin,                             :integer
    table.column :grade,          :string
  end unless ActiveRecord::Base.connection.table_exists?('student_courses')
end

@uin       = College.find_or_create_by(name: 'UIN')
@gunadarma = College.find_or_create_by(name: 'Universitas Gunadarma')
@itb       = College.find_or_create_by(name: 'ITB')

@kedokteran    = Faculty.find_or_create_by(name: 'Kedokteran')
@pendidikan    = Faculty.find_or_create_by(name: 'Pendidikan')
@ilmu_komputer = Faculty.find_or_create_by(name: 'Ilmu Komputer')
@teknik        = Faculty.find_or_create_by(name: 'Teknik')

@kedokteran_umum       = Major.find_or_create_by(name: 'Kedokteran Umum')
@kedokteran_gigi       = Major.find_or_create_by(name: 'Kedokteran Gigi')
@pendidikan_olahraga   = Major.find_or_create_by(name: 'Pendidikan Olahraga')
@pendidikan_ilmu_agama = Major.find_or_create_by(name: 'Pendidikan Ilmu Agama')
@teknik_informatika    = Major.find_or_create_by(name: 'Teknik Informatika')
@sistem_informasi      = Major.find_or_create_by(name: 'Sistem Informasi')
@teknik_fisika         = Major.find_or_create_by(name: 'Teknik Fisika')
@teknik_mesin          = Major.find_or_create_by(name: 'Teknik Mesin')
@teknik_elektro        = Major.find_or_create_by(name: 'Teknik Elektro')

@handi  = Lecturer.find_or_create_by(name: 'Handi')
@teja   = Lecturer.find_or_create_by(name: 'Teja')
@rahmat = Lecturer.find_or_create_by(name: 'Rahmat')
@wawan = Lecturer.find_or_create_by(name: 'Wawan')

@semester_1 = Semester.find_or_create_by(name: 'Semester 1')
@semester_2 = Semester.find_or_create_by(name: 'Semester 2')
@semester_3 = Semester.find_or_create_by(name: 'Semester 3')
@semester_4 = Semester.find_or_create_by(name: 'Semester 4')
@semester_5 = Semester.find_or_create_by(name: 'Semester 5')
@semester_6 = Semester.find_or_create_by(name: 'Semester 6')
@semester_7 = Semester.find_or_create_by(name: 'Semester 7')
@semester_8 = Semester.find_or_create_by(name: 'Semester 8')

@b_inggris     = Course.find_or_create_by(name: 'B. Inggris')
@algoritma     = Course.find_or_create_by(name: 'Algoritma dan Pemrograman')
@kalkulus      = Course.find_or_create_by(name: 'Kalkulus')
@oop           = Course.find_or_create_by(name: 'Object Oriented Programming')
@akuntansi     = Course.find_or_create_by(name: 'Akuntansi')
@metnum        = Course.find_or_create_by(name: 'Metode Numerik')
@rpl           = Course.find_or_create_by(name: 'RPL')
@struktur_data = Course.find_or_create_by(name: 'Struktur Data')

@naufal = Student.find_or_create_by(name: 'Naufal')
@sandi = Student.find_or_create_by(name: 'Sandi')
@hizqil = Student.find_or_create_by(name: 'Hizqil')
@fayad = Student.find_or_create_by(name: 'Fayad')