#　テーブル設計
## usersテーブル

| Column     | Type   | Options      |
|------------|--------|--------------|
| email      | string | null: false  |
| password   | string | null: false  |
| name       | strung | null: false  |
| profile    | text   | null: false  |
| occupation | text   | null: false  |
| position   | text   | null: false  |

### Association

- has_many :prototyoes
- has_many :comments

## prototypesテーブル　

| Column     | Type       | Options     |
| title      | string     | null: false |
| catch_copy | text       | null: false |
| concept    | text       | null: false |
| image      |            |             |
| user       | references |             |

### Association
- has_many :comments
- belongs_to :users

## commentsテーブル
| Column    | Type       | Options     |
| text      | text       | null: false |
| user      | references |             |
| prototype | references |             |

### Association
- belongs_to :prototypes
- belongs_to :users
