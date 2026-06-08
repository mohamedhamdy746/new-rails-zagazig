# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Seeding database..."

# Clear existing data (order matters due to foreign key constraints)
PostEditor.destroy_all
Post.destroy_all
Editor.destroy_all
User.destroy_all

# ── Users ────────────────────────────────────────────────────────────────────
alice = User.create!(
  name:         "Alice Johnson",
  email:        "alice@example.com",
  dob:          "1990-03-15",
  phone_number: "01012345678",
  address:      "123 Nile Street, Cairo"
)

bob = User.create!(
  name:         "Bob Smith",
  email:        "bob@example.com",
  dob:          "1988-07-22",
  phone_number: "01098765432",
  address:      "456 Sphinx Ave, Alexandria"
)

carol = User.create!(
  name:         "Carol White",
  email:        "carol@example.com",
  dob:          "1995-11-05",
  phone_number: "01155556666",
  address:      "789 Pyramid Road, Giza"
)

puts "  Created #{User.count} users"

# ── Editors ──────────────────────────────────────────────────────────────────
editor1 = Editor.create!(
  name:  "Dana Lee",
  email: "dana.lee@editorial.com"
)

editor2 = Editor.create!(
  name:  "Evan Brown",
  email: "evan.brown@editorial.com"
)

editor3 = Editor.create!(
  name:  "Fiona Davis",
  email: "fiona.davis@editorial.com"
)

puts "  Created #{Editor.count} editors"

# ── Posts (owned by user, created by a different user as creator) ─────────────
post1 = Post.create!(
  title:   "Getting Started with Ruby on Rails",
  content: "Rails is a web application framework written in Ruby. It follows the MVC pattern and Convention over Configuration principle.",
  user:    alice,
  creator: bob
)

post2 = Post.create!(
  title:   "Understanding ActiveRecord Associations",
  content: "ActiveRecord provides several types of associations: belongs_to, has_one, has_many, has_many :through, and more.",
  user:    bob,
  creator: carol
)

post3 = Post.create!(
  title:   "RESTful APIs with Rails API Mode",
  content: "Rails API mode strips out middleware that is primarily used for browser applications, making your API leaner and faster.",
  user:    carol,
  creator: alice
)

puts "  Created #{Post.count} posts"

# ── PostEditors (M:M join records) ──────────────────────────────────────────
PostEditor.create!(post: post1, editor: editor1)
PostEditor.create!(post: post1, editor: editor2)
PostEditor.create!(post: post2, editor: editor2)
PostEditor.create!(post: post2, editor: editor3)
PostEditor.create!(post: post3, editor: editor1)
PostEditor.create!(post: post3, editor: editor3)

puts "  Created #{PostEditor.count} post-editor associations"
puts "Done! Database seeded successfully."
