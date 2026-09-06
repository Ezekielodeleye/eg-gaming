# EG Gaming

A GitHub Pages-ready gaming website with:

- Gmail-only login UI using Supabase Auth
- Protected EG Gaming admin dashboard
- Game upload section
- Game cover/design picture upload
- Game add / hide / delete management
- Supabase Storage for uploaded game assets
- Leaderboard and XP display
- WhatsApp community button
- Responsive dark gaming design
- No service-role key exposed in the frontend

## 1. Supabase setup

Open your Supabase project SQL Editor and run **supabase.sql** completely.

The project is already configured for this Supabase project:

`https://rlvwglxklqdnspzquhra.supabase.co`

The admin UID already placed in the SQL and both HTML files is:

`8cd39435-a93c-4b2d-b4f2-f9ec7f61021c`

Do not replace the publishable key with a secret/service-role key.

## 2. Supabase Auth

In Supabase Authentication, make sure Email/Password sign-in is enabled.

If email confirmation is enabled, a new user must confirm the Gmail account before normal password login.

## 3. Put it on GitHub

Upload these files to the root of a repository:

- `index.html`
- `admin.html`
- `supabase.sql`
- `README.md`

Then enable GitHub Pages:

Repository → Settings → Pages → Deploy from branch → `main` → `/ (root)` → Save.

## 4. Admin

Open:

`your-github-pages-address/admin.html`

Log in with the Gmail account whose Supabase UID is:

`8cd39435-a93c-4b2d-b4f2-f9ec7f61021c`

Only that UID is allowed to use the admin dashboard.

## 5. Uploading games

From the admin dashboard you can:

1. Enter a game title.
2. Add a description.
3. Optionally enter a playable game URL.
4. Upload a game file/ZIP.
5. Upload a cover/design picture.
6. Press **Upload & Add Game**.

The public website reads active games from Supabase and displays them automatically.

The page itself does not impose an artificial file-size limit. Real upload/storage limits still depend on the Supabase plan and configuration.

## 6. WhatsApp

The community button uses the supplied EG Gaming WhatsApp community link:

https://chat.whatsapp.com/E6aGvk5QBWl3bkZnQLLU2t