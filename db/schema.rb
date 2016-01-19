# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160119081743) do

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_salaries", force: :cascade do |t|
    t.date     "salary_date"
    t.integer  "employee_id"
    t.integer  "salary_structure_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "address"
    t.date     "date_of_joining"
    t.string   "gender"
    t.integer  "department_id"
    t.integer  "designation_id"
    t.string   "state"
    t.date     "salary_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "leave_allots", force: :cascade do |t|
    t.integer  "leave_structure_id"
    t.integer  "employee_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "leave_applies", force: :cascade do |t|
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "leave_structure_id"
    t.integer  "employee_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "value"
    t.integer  "leave_head_id"
    t.string   "leave_available"
  end

  create_table "leave_assigns", force: :cascade do |t|
    t.integer  "leave_head_id"
    t.integer  "leave_structure_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "leave_employees", force: :cascade do |t|
    t.integer  "leave_allot_id"
    t.string   "head_values"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "pay_date"
    t.integer  "employee_id"
  end

  create_table "leave_heads", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leave_structures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paymonths", force: :cascade do |t|
    t.integer  "month_year"
    t.integer  "day_count"
    t.string   "month_name"
    t.date     "pay_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salary_structures", force: :cascade do |t|
    t.integer  "basic"
    t.integer  "da"
    t.integer  "hra"
    t.integer  "pf"
    t.integer  "others"
    t.integer  "pt"
    t.integer  "emp_pf"
    t.integer  "gratuity"
    t.integer  "conveyance"
    t.integer  "special_allowance"
    t.integer  "gross"
    t.integer  "monthly_ctc"
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
