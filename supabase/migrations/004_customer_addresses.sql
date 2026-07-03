create table public.customer_addresses (
  id uuid primary key default gen_random_uuid(),

  customer_id uuid not null
    references public.profiles(id)
    on delete cascade,

  label text not null,

  governorate text not null,
  area text,
  block text,
  street text,
  house text,

  notes text,

  is_default boolean not null default false,

  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.customer_addresses
enable row level security;
