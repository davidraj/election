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

ActiveRecord::Schema.define(version: 20170609232008) do

  create_table "candidates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.string   "party_name"
    t.integer  "election_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["election_id"], name: "index_candidates_on_election_id", using: :btree
    t.index ["user_id"], name: "index_candidates_on_user_id", using: :btree
  end

  create_table "elections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.text     "description",        limit: 65535
    t.integer  "max_votes_per_user"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "user_votings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "election_id"
    t.integer  "user_id"
    t.integer  "voting_count", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["election_id", "user_id"], name: "index_user_votings_on_election_id_and_user_id", using: :btree
    t.index ["election_id"], name: "index_user_votings_on_election_id", using: :btree
    t.index ["user_id"], name: "index_user_votings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "electoral_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "county"
    t.string   "pincode"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "election_id"
    t.integer  "candidate_id"
    t.integer  "vote_count"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["candidate_id"], name: "index_votes_on_candidate_id", using: :btree
    t.index ["election_id", "candidate_id"], name: "index_votes_on_election_id_and_candidate_id", using: :btree
    t.index ["election_id"], name: "index_votes_on_election_id", using: :btree
    t.index ["vote_count"], name: "index_votes_on_vote_count", using: :btree
  end

  add_foreign_key "candidates", "elections"
  add_foreign_key "candidates", "users"
  add_foreign_key "user_votings", "elections"
  add_foreign_key "user_votings", "users"
  add_foreign_key "votes", "candidates"
  add_foreign_key "votes", "elections"
end
