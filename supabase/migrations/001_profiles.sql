create type user_role as enum (
  'customer',
  'provider',
  'manager',
  'owner'
);

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,

  role user_role not null,

  full_name text,
  phone text,
  email text,
  avatar_url text,

  status text not null default 'active',

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.profiles
enable row level security;
