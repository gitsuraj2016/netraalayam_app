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

ActiveRecord::Schema.define(version: 2018121418192051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_infos", force: :cascade do |t|
    t.string "optomentrist_note"
    t.string "remark"
    t.string "pid_frame"
    t.string "lense_type_a"
    t.string "lense_type_b"
    t.string "lense_type_c"
    t.string "next_visit_date"
    t.string "checked_by"
    t.string "singature"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_additional_infos_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "profession"
    t.string "email"
    t.string "mobile"
    t.string "gender"
    t.string "age"
    t.string "major_complaint"
    t.text "ocular_history"
    t.string "medical_history"
    t.string "current_medication"
    t.string "dob"
    t.string "anniversary_date"
    t.string "cur_date"
    t.integer "entered_by"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_customers_on_store_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "emp_id"
    t.string "name"
    t.string "mobile"
    t.string "email"
    t.boolean "optometrist", default: false
    t.boolean "hto", default: false
    t.boolean "manager", default: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frames", force: :cascade do |t|
    t.string "product_name"
    t.string "brand_name"
    t.string "frame_type"
    t.string "frame_shape"
    t.string "model_no"
    t.string "frame_size"
    t.string "bridge_size"
    t.string "temple_size"
    t.string "eye_size"
    t.string "frame_color"
    t.string "glass_color"
    t.string "weight"
    t.string "frame_material"
    t.string "temple_material"
    t.string "collection"
    t.string "lens_material"
    t.string "gender"
    t.string "height"
    t.string "condition"
    t.string "temple_color"
    t.string "no_s"
    t.decimal "MRP", precision: 8, scale: 2
    t.decimal "NRP", precision: 8, scale: 2
    t.decimal "discount", precision: 8, scale: 2
    t.integer "quantity"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["store_id"], name: "index_frames_on_store_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.bigint "frame_id"
    t.bigint "len_id"
    t.bigint "sunglasse_id"
    t.string "inventory_type"
    t.string "quantity"
    t.boolean "barcode_status"
    t.string "barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frame_id"], name: "index_inventory_items_on_frame_id"
    t.index ["len_id"], name: "index_inventory_items_on_len_id"
    t.index ["sunglasse_id"], name: "index_inventory_items_on_sunglasse_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal "amount", precision: 15, scale: 2, default: "0.0"
    t.string "company"
    t.string "contragent"
    t.string "currency"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "product_type"
    t.integer "product_id"
    t.boolean "barcode_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lens", force: :cascade do |t|
    t.string "product_name"
    t.string "brand_name"
    t.string "lens_type"
    t.string "coatings1"
    t.string "coatings2"
    t.string "coatings3"
    t.string "coatings4"
    t.string "coatings5"
    t.string "material"
    t.string "power_range"
    t.string "no_s"
    t.integer "quantity"
    t.decimal "MRP", precision: 8, scale: 2
    t.decimal "NRP", precision: 8, scale: 2
    t.decimal "discount", precision: 8, scale: 2
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["store_id"], name: "index_lens_on_store_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "item_id"
    t.integer "quantity"
    t.decimal "price", precision: 8, scale: 2
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "delivery_date"
    t.decimal "subtotal", precision: 8, scale: 2
    t.decimal "tax_amt", precision: 8, scale: 2
    t.decimal "discount_amt", precision: 8, scale: 2
    t.decimal "total_amt", precision: 8, scale: 2
    t.decimal "advance_amt", precision: 8, scale: 2
    t.string "payment_mode"
    t.bigint "customer_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "prescription_spectacle_news", force: :cascade do |t|
    t.string "new_rgt_sph_1"
    t.string "new_rgt_cyl_1"
    t.string "new_rgt_axix_1"
    t.string "new_rgt_sph_2"
    t.string "new_rgt_cyl_2"
    t.string "new_rgt_axix_2"
    t.string "new_lft_sph_1"
    t.string "new_lft_cyl_1"
    t.string "new_lft_axix_1"
    t.string "new_lft_sph_2"
    t.string "new_lft_cyl_2"
    t.string "new_lft_axix_2"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_prescription_spectacle_news_on_customer_id"
  end

  create_table "prescription_spectacle_olds", force: :cascade do |t|
    t.string "old_rgt_sph_1"
    t.string "old_rgt_cyl_1"
    t.string "old_rgt_axix_1"
    t.string "old_rgt_sph_2"
    t.string "old_rgt_cyl_2"
    t.string "old_rgt_axix_2"
    t.string "old_lft_sph_1"
    t.string "old_lft_cyl_1"
    t.string "old_lft_axix_1"
    t.string "old_lft_sph_2"
    t.string "old_lft_cyl_2"
    t.string "old_lft_axix_2"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_prescription_spectacle_olds_on_customer_id"
  end

  create_table "prescription_spectacles", force: :cascade do |t|
    t.string "eye_type"
    t.string "pres_type"
    t.string "sph"
    t.string "cyl"
    t.string "axis"
    t.integer "row_no"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_prescription_spectacles_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progressive_details", force: :cascade do |t|
    t.string "repd"
    t.string "lepd"
    t.string "befh"
    t.string "ed"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_progressive_details_on_customer_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "frame_recom"
    t.string "lens_recom"
    t.string "coating_recom"
    t.string "csa_recom"
    t.string "sunrx_recom"
    t.string "frame_fp"
    t.string "lens_fp"
    t.string "coating_fp"
    t.string "csa_fp"
    t.string "sunrx_fp"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_recommendations_on_customer_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sunglasses", force: :cascade do |t|
    t.bigint "product_id"
    t.string "brand_name"
    t.string "frame_type"
    t.string "frame_shape"
    t.string "model_no"
    t.string "frame_size"
    t.string "bridge_size"
    t.string "temple_size"
    t.string "eye_size"
    t.string "frame_color"
    t.string "glass_color"
    t.string "weight"
    t.string "frame_material"
    t.string "temple_material"
    t.string "collection"
    t.string "lens_material"
    t.string "gender"
    t.string "height"
    t.string "condition"
    t.string "temple_color"
    t.string "no_s"
    t.decimal "MRP", precision: 8, scale: 2
    t.decimal "NRP", precision: 8, scale: 2
    t.decimal "discount", precision: 8, scale: 2
    t.integer "quantity"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sunglasses_on_product_id"
    t.index ["store_id"], name: "index_sunglasses_on_store_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "role_id"
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "additional_infos", "customers"
  add_foreign_key "customers", "stores"
  add_foreign_key "frames", "stores"
  add_foreign_key "inventory_items", "frames"
  add_foreign_key "inventory_items", "lens"
  add_foreign_key "inventory_items", "sunglasses", column: "sunglasse_id"
  add_foreign_key "lens", "stores"
  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "stores"
  add_foreign_key "prescription_spectacle_news", "customers"
  add_foreign_key "prescription_spectacle_olds", "customers"
  add_foreign_key "prescription_spectacles", "customers"
  add_foreign_key "progressive_details", "customers"
  add_foreign_key "recommendations", "customers"
  add_foreign_key "sunglasses", "products"
  add_foreign_key "sunglasses", "stores"
end
