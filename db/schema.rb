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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120412204227) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id",                    :null => false
    t.string   "target_type",  :limit => 40
    t.integer  "target_id"
    t.integer  "patron_id",                  :null => false
    t.string   "patron_token", :limit => 20, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "target_name",  :limit => 60
  end

  add_index "activities", ["user_id", "patron_id", "patron_token"], :name => "index_activities_on_user_id_and_patron_id_and_patron_token"

  create_table "arrivals", :force => true do |t|
    t.integer  "loading_id"
    t.datetime "unload_date"
    t.datetime "delivery_date"
    t.string   "unload_point",     :limit => 1
    t.integer  "unload_place_id"
    t.integer  "city_id"
    t.integer  "country_id"
    t.string   "district",         :limit => 30
    t.string   "postcode",         :limit => 5
    t.string   "address",          :limit => 100
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.integer  "consignee_id"
    t.integer  "notify_id"
    t.integer  "notify2_id"
    t.integer  "deliver_id"
    t.integer  "custom_id"
    t.integer  "customofficer_id"
    t.string   "statement",        :limit => 20
    t.date     "statement_date"
    t.string   "notes",            :limit => 250
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "arrivals", ["city_id", "country_id"], :name => "index_arrivals_on_city_id_and_country_id"
  add_index "arrivals", ["loading_id"], :name => "index_arrivals_on_loading_id"

  create_table "betausers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "branches", :force => true do |t|
    t.string   "name",         :limit => 40,                  :null => false
    t.string   "tel",          :limit => 15
    t.string   "fax",          :limit => 15
    t.string   "email",        :limit => 40
    t.string   "postcode",     :limit => 5
    t.string   "address",      :limit => 80
    t.string   "district",     :limit => 40
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "status",       :limit => 1,  :default => "A"
    t.integer  "patron_id",                                   :null => false
    t.string   "patron_token", :limit => 20,                  :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "slug",         :limit => 40
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "branches", ["patron_id", "patron_token"], :name => "index_branches_on_patron_id_and_patron_token"

  create_table "cities", :force => true do |t|
    t.string  "name",       :limit => 40, :null => false
    t.string  "code",       :limit => 10
    t.string  "telcode",    :limit => 10
    t.integer "state_id"
    t.integer "country_id"
    t.float   "latitude"
    t.float   "longitude"
    t.boolean "gmaps"
    t.string  "slug",       :limit => 40
  end

  add_index "cities", ["country_id"], :name => "index_cities_on_country_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id",                                          :null => false
    t.string   "comment_text",     :limit => 300
    t.string   "commentable_type", :limit => 40
    t.integer  "commentable_id"
    t.string   "commenter",        :limit => 1,   :default => "U"
    t.integer  "patron_id",                                        :null => false
    t.string   "patron_token",     :limit => 20,                   :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "comments", ["commentable_type", "commentable_id"], :name => "index_comments_on_commentable_type_and_commentable_id"

  create_table "companies", :force => true do |t|
    t.string   "name",         :limit => 50,                   :null => false
    t.string   "title",        :limit => 100
    t.string   "company_type", :limit => 5
    t.string   "tel",          :limit => 15
    t.string   "fax",          :limit => 15
    t.string   "gsm",          :limit => 15
    t.string   "voip",         :limit => 15
    t.string   "website",      :limit => 30
    t.string   "contact",      :limit => 40
    t.string   "sector",       :limit => 40
    t.string   "email",        :limit => 40
    t.string   "postcode",     :limit => 5
    t.string   "address",      :limit => 80
    t.string   "district",     :limit => 40
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "status",       :limit => 1,   :default => "A"
    t.integer  "branch_id"
    t.integer  "patron_id",                                    :null => false
    t.string   "patron_token", :limit => 20,                   :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "twitter_url",  :limit => 30
    t.string   "facebook_url", :limit => 50
    t.string   "linkedin_url", :limit => 50
    t.string   "notes",        :limit => 250
    t.string   "description",  :limit => 250
    t.integer  "saler_id"
    t.integer  "company_no"
    t.string   "slug",         :limit => 40
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "user_id",                                      :null => false
  end

  add_index "companies", ["name", "patron_id", "patron_token"], :name => "index_companies_on_name_and_patron_id_and_patron_token", :unique => true
  add_index "companies", ["patron_id", "patron_token"], :name => "index_companies_on_patron_id_and_patron_token"
  add_index "companies", ["patron_token", "patron_id"], :name => "index_companies_on_lower_name"

  create_table "contacts", :force => true do |t|
    t.string   "name",         :limit => 30
    t.string   "surname",      :limit => 30, :null => false
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "salutation",   :limit => 5
    t.string   "email",        :limit => 90
    t.string   "tel",          :limit => 15
    t.string   "gsm",          :limit => 15
    t.string   "twitter",      :limit => 50
    t.string   "facebook",     :limit => 50
    t.string   "linkedin",     :limit => 50
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "slug",         :limit => 60
    t.string   "patron_token", :limit => 40
  end

  create_table "containers", :force => true do |t|
    t.integer  "name",                                           :null => false
    t.string   "sealno",         :limit => 40
    t.string   "container_type", :limit => 40
    t.integer  "free_day",                      :default => 0
    t.decimal  "demurrage",                     :default => 0.0
    t.string   "demurrage_curr", :limit => 3
    t.string   "notes",          :limit => 200
    t.integer  "loading_id",                                     :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "containers", ["loading_id"], :name => "index_containers_on_loading_id"
  add_index "containers", ["name", "loading_id"], :name => "index_containers_on_name_and_loading_id", :unique => true

  create_table "counters", :force => true do |t|
    t.string  "counter_type", :limit => 40,                :null => false
    t.string  "operation",    :limit => 20
    t.string  "direction",    :limit => 1
    t.integer "count",                      :default => 0, :null => false
    t.integer "patron_id",                                 :null => false
    t.string  "prefix",       :limit => 10
    t.string  "suffix",       :limit => 10
    t.integer "period",                     :default => 0
  end

  add_index "counters", ["patron_id", "counter_type", "operation", "period"], :name => "counters_unique_index", :unique => true

  create_table "countries", :force => true do |t|
    t.string  "name",      :limit => 40, :null => false
    t.string  "code",      :limit => 10, :null => false
    t.string  "telcode",   :limit => 10
    t.float   "latitude"
    t.float   "longitude"
    t.boolean "gmaps"
    t.string  "slug",      :limit => 40
  end

  create_table "currencies", :force => true do |t|
    t.string "code",       :limit => 5,                   :null => false
    t.string "name",       :limit => 40,                  :null => false
    t.string "symbol",     :limit => 1
    t.float  "multiplier",               :default => 1.0, :null => false
  end

  create_table "departures", :force => true do |t|
    t.integer  "loading_id"
    t.datetime "load_date"
    t.datetime "pickup_date"
    t.string   "load_point",       :limit => 1
    t.integer  "load_place_id"
    t.integer  "city_id"
    t.integer  "country_id"
    t.string   "district",         :limit => 30
    t.string   "postcode",         :limit => 5
    t.string   "address",          :limit => 100
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.integer  "loader_id"
    t.integer  "sender_id"
    t.integer  "custom_id"
    t.integer  "customofficer_id"
    t.string   "statement",        :limit => 20
    t.date     "statement_date"
    t.string   "notes",            :limit => 250
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "departures", ["city_id", "country_id"], :name => "index_departures_on_city_id_and_country_id"
  add_index "departures", ["loading_id"], :name => "index_departures_on_loading_id"

  create_table "feedbacks", :force => true do |t|
    t.string   "name",       :limit => 40,  :null => false
    t.string   "email",      :limit => 40
    t.string   "msg",        :limit => 500
    t.integer  "user_id"
    t.integer  "patron_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "findocs", :force => true do |t|
    t.date     "docdate",                                        :null => false
    t.float    "amount",                      :default => 0.0,   :null => false
    t.string   "curr",         :limit => 3,                      :null => false
    t.float    "rate"
    t.float    "rate_amount",                 :default => 0.0
    t.string   "rate_type",    :limit => 3
    t.string   "unit_type",    :limit => 3,                      :null => false
    t.integer  "unit_id",                                        :null => false
    t.string   "unit_name",    :limit => 50
    t.string   "process_type", :limit => 10
    t.string   "target_type",  :limit => 3
    t.integer  "target_id"
    t.string   "target_name",  :limit => 50
    t.string   "docno",        :limit => 10
    t.string   "extno",        :limit => 20
    t.string   "doctype",      :limit => 10
    t.string   "des",          :limit => 100
    t.boolean  "glstatus",                    :default => false
    t.integer  "gldocno"
    t.integer  "user_id",                                        :null => false
    t.integer  "patron_id",                                      :null => false
    t.string   "patron_token", :limit => 40,                     :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "follows", :force => true do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], :name => "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], :name => "fk_follows"

  create_table "journals", :force => true do |t|
    t.date    "process_date",                                  :null => false
    t.string  "journal_model",  :limit => 40
    t.string  "journaled_type", :limit => 40
    t.integer "journaled_id",                                  :null => false
    t.integer "unit",                         :default => 0
    t.decimal "amount",                       :default => 0.0
    t.integer "patron_id",                                     :null => false
    t.string  "patron_token",   :limit => 20
  end

  add_index "journals", ["journaled_type", "journaled_id", "journal_model", "process_date", "patron_id"], :name => "index_journals_on_journal_model_and_process_date_and_patron_id", :unique => true
  add_index "journals", ["patron_id"], :name => "index_journals_on_patron_id"

  create_table "likes", :force => true do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], :name => "fk_likeables"
  add_index "likes", ["liker_id", "liker_type"], :name => "fk_likes"

  create_table "loadings", :force => true do |t|
    t.string   "reference",     :limit => 30,                   :null => false
    t.integer  "position_id"
    t.string   "operation",     :limit => 20,                   :null => false
    t.string   "direction",     :limit => 1,                    :null => false
    t.string   "incoterm",      :limit => 20
    t.string   "paid_at",       :limit => 20
    t.string   "channel",       :limit => 30
    t.string   "load_type",     :limit => 1
    t.integer  "company_id",                                    :null => false
    t.integer  "agent_id"
    t.integer  "user_id",                                       :null => false
    t.integer  "saler_id"
    t.decimal  "freight_price",                :default => 0.0
    t.string   "freight_curr",  :limit => 5
    t.decimal  "agent_price",                  :default => 0.0
    t.string   "agent_curr"
    t.float    "agent_share"
    t.decimal  "product_price",                :default => 0.0
    t.string   "product_curr"
    t.string   "slug",          :limit => 40
    t.boolean  "bank_flag"
    t.integer  "bank_id"
    t.string   "producer",      :limit => 60
    t.string   "marks_nos",     :limit => 50
    t.string   "hts_no",        :limit => 20
    t.float    "brut_wg"
    t.float    "volume"
    t.float    "ladameter"
    t.float    "price_wg"
    t.integer  "patron_id",                                     :null => false
    t.string   "patron_token",  :limit => 20,                   :null => false
    t.string   "commodity",     :limit => 500
    t.string   "notes",         :limit => 500
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "status",        :limit => 1,   :default => "A"
    t.integer  "branch_id",                                     :null => false
    t.string   "stage",         :limit => 4
    t.datetime "stage_date"
  end

  add_index "loadings", ["patron_id", "patron_token"], :name => "index_loadings_on_patron_id_and_patron_token"
  add_index "loadings", ["reference", "patron_id", "patron_token"], :name => "index_loadings_on_reference_and_patron_id_and_patron_token", :unique => true

  create_table "mentions", :force => true do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], :name => "fk_mentionables"
  add_index "mentions", ["mentioner_id", "mentioner_type"], :name => "fk_mentions"

  create_table "operations", :id => false, :force => true do |t|
    t.string "code",                         :null => false
    t.string "name",           :limit => 40, :null => false
    t.string "operation_type", :limit => 20, :null => false
  end

  create_table "packages", :force => true do |t|
    t.integer  "loading_id",                                    :null => false
    t.integer  "container_id"
    t.string   "pack_type",                                     :null => false
    t.integer  "total",                        :default => 0
    t.integer  "dimension1"
    t.integer  "dimension2"
    t.integer  "dimension3"
    t.float    "brutwg",                       :default => 0.0
    t.float    "netwg",                        :default => 0.0
    t.float    "volume",                       :default => 0.0
    t.float    "lada",                         :default => 0.0
    t.string   "imo",           :limit => 20
    t.string   "gtip",          :limit => 20
    t.string   "po",            :limit => 20
    t.string   "description",   :limit => 200
    t.string   "loading_notes", :limit => 200
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "packages", ["loading_id", "container_id"], :name => "index_packages_on_loading_id_and_container_id"

  create_table "patrons", :force => true do |t|
    t.string   "name",            :limit => 40,                     :null => false
    t.string   "title",           :limit => 60
    t.string   "email",           :limit => 60,                     :null => false
    t.string   "website",         :limit => 60
    t.string   "tel",             :limit => 20
    t.string   "fax",             :limit => 20
    t.string   "gsm",             :limit => 20
    t.string   "postcode",        :limit => 5
    t.string   "address",         :limit => 60
    t.string   "contact_name",    :limit => 40
    t.string   "contact_surname", :limit => 40
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "patron_type",     :limit => 20
    t.string   "employees",       :limit => 10
    t.string   "language",        :limit => 2
    t.string   "status",          :limit => 1,   :default => "A"
    t.string   "logo"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "slug",            :limit => 40
    t.string   "token",           :limit => 40
    t.string   "time_zone",       :limit => 30
    t.string   "district",        :limit => 40
    t.string   "currency",        :limit => 10
    t.string   "operations",      :limit => 100
    t.boolean  "vehicle_owner",                  :default => false
    t.boolean  "depot_owner",                    :default => false
    t.string   "iata_code",       :limit => 30
    t.string   "fmc_code",        :limit => 30
  end

  add_index "patrons", ["slug"], :name => "index_patrons_on_slug", :unique => true

  create_table "people", :force => true do |t|
    t.string   "name",         :limit => 30,                   :null => false
    t.string   "surname",      :limit => 30,                   :null => false
    t.integer  "user_id",                                      :null => false
    t.string   "socialname",   :limit => 30
    t.string   "salutation",   :limit => 20
    t.string   "gender",       :limit => 1
    t.string   "email",        :limit => 40,                   :null => false
    t.string   "jobtitle",     :limit => 40
    t.string   "hometel",      :limit => 15
    t.string   "busitel",      :limit => 15
    t.string   "exttel",       :limit => 15
    t.string   "fax",          :limit => 15
    t.string   "gsm",          :limit => 15
    t.string   "voip",         :limit => 15
    t.string   "website",      :limit => 30
    t.string   "postcode",     :limit => 5
    t.string   "address",      :limit => 80
    t.string   "district",     :limit => 40
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "status",       :limit => 1,   :default => "A"
    t.integer  "branch_id"
    t.integer  "patron_id",                                    :null => false
    t.string   "patron_token", :limit => 20,                   :null => false
    t.string   "twitter",      :limit => 30
    t.string   "facebook",     :limit => 50
    t.string   "linkedin",     :limit => 50
    t.integer  "manager_id"
    t.integer  "person_no"
    t.date     "start_date"
    t.string   "citizen_no",   :limit => 20
    t.date     "birth_date"
    t.string   "nation",       :limit => 2
    t.string   "avatar",       :limit => 100
    t.string   "slug",         :limit => 60
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "people", ["patron_id", "patron_token"], :name => "index_people_on_patron_id_and_patron_token"
  add_index "people", ["user_id", "patron_id", "patron_token"], :name => "index_people_on_user_id_and_patron_id_and_patron_token", :unique => true
  add_index "people", ["user_id"], :name => "index_people_on_user_id"

  create_table "places", :force => true do |t|
    t.string   "name",        :limit => 50
    t.string   "code",        :limit => 20
    t.string   "place_type",  :limit => 10
    t.string   "district",    :limit => 30
    t.string   "postcode",    :limit => 5
    t.string   "address",     :limit => 100
    t.integer  "city_id"
    t.integer  "country_id"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.string   "description", :limit => 250
    t.string   "slug",        :limit => 50
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "places", ["city_id", "country_id"], :name => "index_places_on_city_id_and_country_id"

  create_table "positions", :force => true do |t|
    t.string   "reference",       :limit => 30,                   :null => false
    t.string   "operation",       :limit => 20,                   :null => false
    t.string   "direction",       :limit => 1,                    :null => false
    t.string   "incoterm",        :limit => 20
    t.string   "paid_at",         :limit => 20
    t.string   "load_type",       :limit => 1
    t.integer  "agent_id"
    t.integer  "user_id",                                         :null => false
    t.integer  "load_place_id"
    t.datetime "load_date"
    t.integer  "unload_place_id"
    t.datetime "unload_date"
    t.decimal  "freight_price",                  :default => 0.0
    t.string   "freight_curr",    :limit => 5
    t.string   "status",          :limit => 4,   :default => "A"
    t.date     "report_date"
    t.string   "stage",           :limit => 4
    t.datetime "stage_date"
    t.string   "ref_no1",         :limit => 20
    t.string   "ref_type1",       :limit => 2
    t.string   "ref_no2",         :limit => 20
    t.string   "ref_type2",       :limit => 2
    t.string   "ref_no3",         :limit => 20
    t.string   "ref_type3",       :limit => 2
    t.string   "ref_no4",         :limit => 20
    t.string   "ref_type4",       :limit => 2
    t.string   "slug",            :limit => 40
    t.string   "notes",           :limit => 500
    t.integer  "patron_id",                                       :null => false
    t.string   "patron_token",    :limit => 20,                   :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.decimal  "agent_price",                    :default => 0.0
    t.string   "agent_curr",      :limit => 3
    t.integer  "branch_id",                                       :null => false
    t.string   "waybill_no",      :limit => 30
    t.date     "waybill_date"
  end

  add_index "positions", ["patron_id", "patron_token"], :name => "index_positions_on_patron_id_and_patron_token"
  add_index "positions", ["reference", "patron_id", "patron_token"], :name => "index_positions_on_reference_and_patron_id_and_patron_token", :unique => true

  create_table "posts", :force => true do |t|
    t.integer  "user_id",                                        :null => false
    t.string   "message",      :limit => 300
    t.string   "target_type",  :limit => 40
    t.integer  "target_id"
    t.string   "target_name",  :limit => 40
    t.string   "post_type",    :limit => 2
    t.boolean  "is_private",                  :default => false
    t.boolean  "is_syspost",                  :default => false
    t.integer  "patron_id",                                      :null => false
    t.string   "patron_token", :limit => 20,                     :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "posts", ["patron_id", "patron_token"], :name => "index_posts_on_patron_id_and_patron_token"
  add_index "posts", ["target_type", "target_id"], :name => "index_posts_on_target_type_and_target_id"

  create_table "searches", :force => true do |t|
    t.string   "model",          :limit => 60
    t.string   "reference",      :limit => 40
    t.string   "operation",      :limit => 20
    t.string   "direction",      :limit => 1
    t.string   "paid_at",        :limit => 20
    t.string   "load_type",      :limit => 1
    t.integer  "agent_id"
    t.integer  "user_id",                                        :null => false
    t.integer  "branch_id"
    t.date     "docdate1"
    t.date     "docdate2"
    t.integer  "saler_id"
    t.integer  "driver_id"
    t.integer  "company_id"
    t.integer  "transporter_id"
    t.string   "status",         :limit => 4
    t.date     "report_date1"
    t.date     "report_date2"
    t.integer  "country_id"
    t.integer  "city_id"
    t.boolean  "searched",                     :default => true
    t.integer  "patron_id",                                      :null => false
    t.string   "patron_token",   :limit => 20,                   :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "searches", ["patron_id", "patron_token"], :name => "index_searches_on_patron_id_and_patron_token"

  create_table "states", :force => true do |t|
    t.string  "name",       :limit => 40, :null => false
    t.string  "code",       :limit => 10
    t.string  "telcode",    :limit => 10
    t.integer "country_id"
    t.float   "latitude"
    t.float   "longitude"
    t.boolean "gmaps"
    t.string  "slug",       :limit => 40
  end

  add_index "states", ["country_id"], :name => "index_states_on_country_id"

  create_table "teams", :force => true do |t|
    t.string   "name",         :limit => 40
    t.integer  "patron_id",                  :null => false
    t.string   "patron_token", :limit => 20, :null => false
    t.string   "slug",         :limit => 40
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "teams", ["patron_id", "patron_token"], :name => "index_teams_on_patron_id_and_patron_token"

  create_table "transnodes", :force => true do |t|
    t.integer  "position_id",                                     :null => false
    t.string   "trans_method",    :limit => 20,                   :null => false
    t.string   "voyage",          :limit => 20
    t.string   "vessel",          :limit => 20
    t.string   "truck",           :limit => 20
    t.string   "driver",          :limit => 50
    t.integer  "transporter_id"
    t.integer  "forwarder_id"
    t.integer  "supplier_id"
    t.string   "departure_place", :limit => 50
    t.datetime "departure_date"
    t.date     "departured_date"
    t.string   "arrival_place",   :limit => 50
    t.datetime "arrival_date"
    t.date     "arrived_date"
    t.decimal  "freight_price",                  :default => 0.0
    t.string   "freight_curr",    :limit => 5
    t.string   "ticket_no",       :limit => 20
    t.date     "ticket_date"
    t.string   "doc1_no",         :limit => 20
    t.string   "doc2_no",         :limit => 20
    t.string   "doc3_no",         :limit => 20
    t.string   "doc4_no",         :limit => 20
    t.string   "notes",           :limit => 500
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "transnodes", ["position_id"], :name => "index_transnodes_on_position_id"

  create_table "users", :force => true do |t|
    t.string   "email",                           :limit => 40,                                           :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "name",                            :limit => 40
    t.string   "surname",                         :limit => 40
    t.integer  "patron_id"
    t.string   "patron_key",                      :limit => 20
    t.string   "language",                                      :default => "en"
    t.string   "time_zone",                                     :default => "Eastern Time (US & Canada)"
    t.string   "locale",                          :limit => 8
    t.string   "region",                          :limit => 2
    t.string   "user_type",                       :limit => 2
    t.string   "mail_encoding",                   :limit => 20
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_email_time"
    t.datetime "password_reset_token_expires_at"
    t.integer  "failed_logins_count"
    t.integer  "lock_expires_at"
    t.string   "role"
    t.string   "avatar"
    t.string   "slug"
    t.datetime "created_at",                                                                              :null => false
    t.datetime "updated_at",                                                                              :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["patron_id", "patron_key"], :name => "index_users_on_patron_id_and_patron_key"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

  create_table "vehicles", :force => true do |t|
    t.string   "code",           :limit => 20,                   :null => false
    t.string   "vehicle_class",  :limit => 20
    t.string   "vehicle_type",   :limit => 20
    t.string   "brand",          :limit => 20
    t.string   "model",          :limit => 50
    t.integer  "model_year"
    t.integer  "patron_id"
    t.string   "owner",          :limit => 50
    t.decimal  "vehicle_price",                 :default => 0.0
    t.string   "price_curr",     :limit => 5
    t.date     "buying_date"
    t.integer  "fuel_capacity"
    t.integer  "fuel_capacity2"
    t.string   "fuel_type",      :limit => 10
    t.string   "tire_size",      :limit => 2
    t.string   "link_type",      :limit => 2
    t.string   "sat_no",         :limit => 20
    t.float    "longitude"
    t.float    "latitude"
    t.string   "slug",           :limit => 20
    t.string   "notes",          :limit => 250
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "vehicles", ["code", "patron_id"], :name => "index_vehicles_on_code_and_patron_id", :unique => true
  add_index "vehicles", ["patron_id"], :name => "index_vehicles_on_patron_id"

  create_table "waybills", :force => true do |t|
    t.string   "reference",        :limit => 40
    t.string   "waybill_type",     :limit => 1
    t.string   "copy_flag",        :limit => 1
    t.string   "waybill_page",     :limit => 4
    t.string   "waybillable_type", :limit => 40
    t.integer  "waybillable_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

end