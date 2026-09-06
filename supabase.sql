-- EG Gaming Supabase Schema
-- Run this in your Supabase SQL Editor

-- Create profiles table
create table if not exists profiles (
  id uuid primary key references auth.users on delete cascade,
  display_name text not null default 'Player',
  xp int not null default 0,
  level int not null default 1,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

-- Create games table
create table if not exists games (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  game_url text,
  file_url text,
  image_url text,
  active boolean default true,
  created_by uuid references auth.users on delete set null,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

-- Create scores table
create table if not exists scores (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users on delete cascade,
  score int not null,
  game_id uuid references games on delete set null,
  created_at timestamp with time zone default now()
);

-- Set up RLS policies
alter table profiles enable row level security;
alter table games enable row level security;
alter table scores enable row level security;

-- Profiles: Users can read all profiles, update their own
create policy "Profiles are viewable by everyone" on profiles for select using (true);
create policy "Users can update their own profile" on profiles for update using (auth.uid() = id);

-- Games: Anyone can read active games
create policy "Games are viewable by everyone" on games for select using (true);
create policy "Only creator can update/delete games" on games for update using (auth.uid() = created_by);
create policy "Only creator can delete games" on games for delete using (auth.uid() = created_by);
create policy "Authenticated users can insert games" on games for insert with check (auth.role() = 'authenticated');

-- Scores: Users can read all scores, insert their own
create policy "Scores are viewable by everyone" on scores for select using (true);
create policy "Users can insert scores" on scores for insert with check (auth.uid() = user_id);

-- Create storage bucket for games
insert into storage.buckets (id, name, public) values ('eg-games', 'eg-games', true) on conflict do nothing;

-- Set up storage policies
create policy "Games bucket is public" on storage.objects for select using (bucket_id = 'eg-games');
create policy "Authenticated users can upload" on storage.objects for insert with check (
  bucket_id = 'eg-games' and auth.role() = 'authenticated'
);