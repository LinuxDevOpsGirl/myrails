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

ActiveRecord::Schema.define(version: 2019_01_01_110837) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=big5 COLLATE=big5_bin", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "affiliates", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "songlist_id"
    t.string "vendor"
    t.string "country"
    t.text "url"
  end

  create_table "answers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "email"
    t.string "name"
  end

  create_table "assignments", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "film_id"
    t.integer "section_id"
    t.string "challenge_type"
    t.text "challenge"
    t.boolean "resolved", default: false
    t.integer "user_id"
  end

  create_table "companies", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "company_pictures", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.integer "parent_id"
    t.string "content_type"
    t.string "filename"
    t.string "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
  end

  create_table "editors", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "film_id"
    t.integer "person_id"
  end

  create_table "favourites", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "film_id"
  end

  create_table "film_covers", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "film_id"
    t.integer "parent_id"
    t.string "content_type"
    t.string "filename"
    t.string "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
  end

  create_table "filmcompanies", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "film_id"
    t.integer "company_id"
  end

  create_table "filmers", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "film_id"
    t.integer "person_id"
  end

  create_table "films", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "format_web"
    t.boolean "format_dvd"
    t.boolean "format_vhs"
    t.boolean "format_blu"
    t.string "country"
    t.string "runtime"
    t.text "notes"
    t.integer "release_year"
    t.integer "user_id"
    t.boolean "draft", default: true
    t.boolean "locked", default: false
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
  end

  create_table "homes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "found_date"
    t.string "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "notes"
  end

  create_table "post_films", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "post_id"
    t.integer "film_id"
    t.text "notes"
  end

  create_table "posts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.text "post"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "draft", default: true
    t.boolean "continues"
    t.integer "section_id"
    t.integer "category_id"
    t.integer "user_id"
    t.boolean "sticky", default: false
  end

  create_table "ratings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "section_id"
    t.integer "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "riders", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "section_id"
    t.integer "person_id"
  end

  create_table "roles", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "film_id"
    t.string "name"
    t.text "url"
    t.text "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "mobile", default: false
    t.boolean "frontpage", default: false
  end

  create_table "songlists", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.string "album"
    t.string "label"
    t.text "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "section_id"
    t.integer "songlist_id"
  end

  create_table "users", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "active", default: false, null: false
    t.string "perishable_token", null: false
    t.string "token"
    t.string "secret"
  end

  create_table "watchlists", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "film_id"
    t.integer "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
