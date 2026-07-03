create table public.packages (
  id uuid primary key default gen_random_uuid(),

  service_id uuid not null
    references public.services(id)
    on delete cascade,

  package_name text not null,

  price numeric(10,3) not null,

  capacity integer,

  includes text,

  description text,

  active boolean default true,

  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.packages
enable row level security;
