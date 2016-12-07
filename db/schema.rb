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

ActiveRecord::Schema.define(version: 20161201164630) do

  create_table "adpositions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "position"
    t.string   "name"
    t.string   "image"
    t.string   "link"
    t.text     "html",       limit: 65535
    t.integer  "visit",                    default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "mem_id"
    t.integer  "repo_id"
    t.string   "title"
    t.text     "css",        limit: 65535
    t.text     "js",         limit: 65535
    t.text     "html",       limit: 65535
    t.string   "status",                   default: "NORMAL"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.float    "wealth",     limit: 24,    default: 0.0
    t.string   "typcd",                    default: "repo"
    t.integer  "favor",                    default: 0
    t.integer  "comment",                  default: 0
    t.string   "group"
  end

  add_index "codes", ["mem_id"], name: "index_codes_on_mem_id", using: :btree
  add_index "codes", ["repo_id"], name: "index_codes_on_repo_id", using: :btree

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "recsts",     limit: 1,     default: "0"
    t.string   "typ"
    t.integer  "idcd"
    t.integer  "mem_id"
    t.text     "con",        limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "favor",                    default: 0
    t.float    "wealth",     limit: 24,    default: 0.0
  end

  create_table "docs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "con",        limit: 4294967295
    t.text     "markdown",   limit: 4294967295
    t.string   "cover",      limit: 55
    t.integer  "mem_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "docsubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "mem_id"
    t.text     "con",        limit: 65535
    t.string   "status",     limit: 10,    default: "UNREAD"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "goods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "cover"
    t.text     "desc",       limit: 65535
    t.float    "price",      limit: 24
    t.integer  "order"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "links", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "url"
    t.integer  "order",      default: 0
    t.string   "sdesc"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "mauths", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "recsts",     limit: 1, default: "0"
    t.integer  "mem_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "mem_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "mem_id"
    t.string   "gender"
    t.string   "location"
    t.string   "html_url"
    t.string   "blog"
    t.integer  "followers"
    t.integer  "following"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "github"
    t.string   "twitter"
    t.string   "weibo_nc"
    t.string   "weibo_url"
    t.string   "company"
    t.string   "job"
  end

  create_table "mem_ranks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "mem_id"
    t.integer  "worldwide"
    t.integer  "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mem_repos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "mem_id"
    t.string   "name"
    t.string   "description"
    t.string   "html_url"
    t.integer  "stargazers_count"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "mems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nc"
    t.string   "email"
    t.string   "avatar",     limit: 100
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "pwd"
    t.string   "role",                   default: "user"
    t.integer  "reputation",             default: 0
    t.integer  "using",                  default: 0
    t.float    "wealth",     limit: 24,  default: 0.0
  end

  add_index "mems", ["nc", "email"], name: "search", using: :btree

  create_table "menutyps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.string   "sdesc"
    t.string   "fdesc"
    t.string   "parent"
    t.string   "typcd"
    t.text     "home",       limit: 65535
    t.integer  "num",                      default: 0
    t.string   "icon"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "home_index",               default: 0
    t.string   "alia"
    t.string   "group",                    default: "REPO"
  end

  create_table "msgs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "con",        limit: 65535
    t.string   "level"
    t.string   "typ"
    t.integer  "from"
    t.integer  "to"
    t.string   "status",                   default: "UNREAD"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "notifies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "mem_id"
    t.string   "typcd"
    t.integer  "amount",     default: 0
    t.string   "desc"
    t.string   "fdesc"
    t.string   "state",      default: "UNREAD"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "link"
  end

  create_table "opers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "typ"
    t.integer  "idcd"
    t.integer  "mem_id"
    t.string   "opertyp"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "order",      default: 0
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "good_id"
    t.integer  "mem_id"
    t.integer  "amount"
    t.float    "price",       limit: 24
    t.float    "total_price", limit: 24
    t.string   "remark"
    t.string   "state"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "orders", ["good_id"], name: "index_orders_on_good_id", using: :btree
  add_index "orders", ["mem_id"], name: "index_orders_on_mem_id", using: :btree

  create_table "readmes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "mem_id"
    t.integer  "repo_id"
    t.text     "about",      limit: 4294967295
    t.text     "old",        limit: 4294967295
    t.string   "sdesc",      limit: 200,        default: "初始化文档"
    t.string   "status",     limit: 45,         default: "UNREAD"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.float    "wealth",     limit: 24,         default: 0.0
  end

  create_table "releases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "repo_id"
    t.string   "tag_name"
    t.datetime "published_at"
    t.text     "body",         limit: 65535
    t.boolean  "prerelease"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "releases", ["repo_id"], name: "index_releases_on_repo_id", using: :btree

  create_table "repo_notifies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "repo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repo_resources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "recsts",     limit: 2, default: "1"
    t.string   "title"
    t.string   "url"
    t.string   "repo_alia"
    t.integer  "mem_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "repo_id"
  end

  create_table "repo_trends", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "repo_id"
    t.integer  "overall"
    t.date     "date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "trend",      default: 0
  end

  create_table "repos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name",                                                            collation: "utf8_general_ci"
    t.string   "full_name",                                                       collation: "utf8_general_ci"
    t.string   "alia",                                                            collation: "utf8_general_ci"
    t.string   "html_url",                                                        collation: "utf8_general_ci"
    t.text     "description",       limit: 4294967295
    t.text     "description_cn",    limit: 4294967295
    t.string   "homepage",                                                        collation: "utf8_general_ci"
    t.integer  "stargazers_count"
    t.integer  "forks_count"
    t.integer  "subscribers_count"
    t.datetime "pushed_at"
    t.text     "about",             limit: 4294967295
    t.text     "about_zh",          limit: 4294967295
    t.string   "typcd",                                                           collation: "utf8_general_ci"
    t.string   "rootyp",                                                          collation: "utf8_general_ci"
    t.string   "owner",             limit: 100,                                   collation: "utf8_general_ci"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "outdated",          limit: 1,          default: "0",              collation: "utf8_general_ci"
    t.string   "tag",                                                             collation: "utf8_general_ci"
    t.string   "cover",                                                           collation: "utf8_general_ci"
    t.integer  "recommend",                            default: 0
    t.integer  "trend",                                default: 0
    t.datetime "github_created_at"
    t.integer  "mark",                                 default: 0
    t.integer  "issue_res",                            default: 0
    t.string   "typcd_zh",                                                        collation: "utf8_general_ci"
    t.string   "rootyp_zh",                                                       collation: "utf8_general_ci"
    t.integer  "demo"
    t.integer  "startup"
    t.string   "hidetags",                                                        collation: "utf8_general_ci"
    t.integer  "using",                                default: 0
    t.integer  "experience",                           default: 0
  end

  add_index "repos", ["rootyp", "typcd", "html_url"], name: "search", using: :btree

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "typ"
    t.string   "sdesc"
    t.text     "fdesc",      limit: 65535
    t.integer  "var"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.string   "title"
    t.string   "cover"
    t.string   "sdesc"
    t.integer  "order",      default: 0
    t.integer  "amount",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "website"
    t.integer  "repo_id"
  end

  create_table "submits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "html_url"
    t.string   "rootyp"
    t.string   "typcd"
    t.string   "status",     limit: 45, default: "UNREAD"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "subscribes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "con",        limit: 65535
    t.string   "typcd"
    t.integer  "mem_id"
    t.string   "author"
    t.string   "origin"
    t.string   "state",      limit: 1,     default: "1"
    t.integer  "visit",                    default: 0
    t.integer  "favor",                    default: 0
    t.integer  "comment",                  default: 0
    t.string   "tag"
    t.string   "var1"
    t.string   "var2"
    t.integer  "var3"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "wealth_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "mem_id"
    t.float    "amount",     limit: 24
    t.float    "balance",    limit: 24
    t.string   "remark"
    t.string   "flag"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "wealth_logs", ["mem_id"], name: "index_wealth_logs_on_mem_id", using: :btree

end
